{ self, inputs, ... }: {

  flake.nixosModules.boyDeerHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports =
      [ (modulesPath + "/installer/scan/not-detected.nix")
      ];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "uas" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
    { device = "/dev/disk/by-uuid/05652a75-7f60-43e4-a0fa-27f39058e86e";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@" ];
    };

    fileSystems."/home" =
    { device = "/dev/disk/by-uuid/05652a75-7f60-43e4-a0fa-27f39058e86e";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@home" ];
    };

    fileSystems."/root" =
    { device = "/dev/disk/by-uuid/05652a75-7f60-43e4-a0fa-27f39058e86e";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@root" ];
    };

    fileSystems."/srv" =
    { device = "/dev/disk/by-uuid/05652a75-7f60-43e4-a0fa-27f39058e86e";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@srv" ];
    };

    fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/05652a75-7f60-43e4-a0fa-27f39058e86e";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@log" ];
    };

    fileSystems."/var/cache" =
    { device = "/dev/disk/by-uuid/05652a75-7f60-43e4-a0fa-27f39058e86e";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@cache" ];
    };

    fileSystems."/var/tmp" =
    { device = "/dev/disk/by-uuid/05652a75-7f60-43e4-a0fa-27f39058e86e";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@tmp" ];
    };

    fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0ABA-D35E";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

    swapDevices = [ ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    hardware.bluetooth.enable = true;
  };
}
