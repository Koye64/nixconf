{ self, inputs, ... }: {
  flake.nixosModules.vm = { config, pkgs, lib, ... }: {
    boot.extraModulePackages = [ config.boot.kernelPackages.kvmfr ];
    boot.initrd.kernelModules = [
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
      "kvmfr"
    ];

    boot.kernelParams = [
      "kvmfr.static_size_mb=64"
      # "video=efifb:off"
      "vfio-pci.ids=1002:13c0,1002:1640,1022:1649"
      # "vfio-pci.disable_vga=1"
    ];

    services.udev.packages = lib.singleton (pkgs.writeTextFile
      {
        name = "kvmfr";
        text = ''
          SUBSYSTEM=="kvmfr", GROUP="kvm", MODE="0660", TAG+="uaccess"
        '';
        destination = "/etc/udev/rules.d/70-kvmfr.rules";
      }
    );

    programs.virt-manager.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        verbatimConfig = ''
          namespaces = []
          cgroup_device_acl = [
            "/dev/null", "/dev/full", "/dev/zero",
            "/dev/random", "/dev/urandom",
            "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
            "/dev/rtc","/dev/hpet", "/dev/vfio/vfio",
            "/dev/kvmfr0"
          ]
        '';
      };
    };
    users.users.koye.extraGroups = [ "libvirtd" ];
    networking.firewall.trustedInterfaces = [ "virbr0" ];

    environment.systemPackages = with pkgs; [
      pciutils
      dnsmasq
      looking-glass-client
    ];
  };
}
