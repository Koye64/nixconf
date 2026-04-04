{ self, inputs, ... }: {

  flake.nixosModules.myMachineHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/034cc913-5fd8-4291-b779-61dcd3271925";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@" ];
      };

    fileSystems."/home" =
      { device = "/dev/disk/by-uuid/034cc913-5fd8-4291-b779-61dcd3271925";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@home" ];
      };

    fileSystems."/root" =
      { device = "/dev/disk/by-uuid/034cc913-5fd8-4291-b779-61dcd3271925";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@root" ];
      };

    fileSystems."/srv" =
      { device = "/dev/disk/by-uuid/034cc913-5fd8-4291-b779-61dcd3271925";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@srv" ];
      };

    fileSystems."/var/cache" =
      { device = "/dev/disk/by-uuid/034cc913-5fd8-4291-b779-61dcd3271925";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@cache" ];
      };

    fileSystems."/var/log" =
      { device = "/dev/disk/by-uuid/034cc913-5fd8-4291-b779-61dcd3271925";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@log" ];
      };

    fileSystems."/var/tmp" =
      { device = "/dev/disk/by-uuid/034cc913-5fd8-4291-b779-61dcd3271925";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@tmp" ];
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/CB6D-7525";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
      };

    swapDevices = [ ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  };

}
