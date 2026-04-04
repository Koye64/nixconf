{ self, inputs, ... }: {
  flake.nixosModules.myMachineHardware = { pkgs, lib, modulesPath, ... }: {
    imports =
      [ (modulesPath + "/profiles/qemu-guest.nix")
      ];
  
    boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];
  
    fileSystems."/" =
      { device = "/dev/disk/by-uuid/39a3fa45-430a-49ee-97d8-ac3c75ac9138";
        fsType = "btrfs";
        options = [ "subvol=@" ];
      };
  
    fileSystems."/home" =
      { device = "/dev/disk/by-uuid/39a3fa45-430a-49ee-97d8-ac3c75ac9138";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@home" ];
      };
  
    fileSystems."/root" =
      { device = "/dev/disk/by-uuid/39a3fa45-430a-49ee-97d8-ac3c75ac9138";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@root" ];
      };
  
    fileSystems."/srv" =
      { device = "/dev/disk/by-uuid/39a3fa45-430a-49ee-97d8-ac3c75ac9138";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@srv" ];
      };
  
    fileSystems."/var/cache" =
      { device = "/dev/disk/by-uuid/39a3fa45-430a-49ee-97d8-ac3c75ac9138";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@cache" ];
      };
  
    fileSystems."/var/log" =
      { device = "/dev/disk/by-uuid/39a3fa45-430a-49ee-97d8-ac3c75ac9138";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@log" ];
      };
  
    fileSystems."/var/tmp" =
      { device = "/dev/disk/by-uuid/39a3fa45-430a-49ee-97d8-ac3c75ac9138";
        fsType = "btrfs";
        options = [ "compress=zstd" "subvol=@tmp" ];
      };
  
    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/35C3-4A66";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
      };
  
    swapDevices = [ ];
  
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
