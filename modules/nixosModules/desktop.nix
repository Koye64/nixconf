{ self, inputs, ... }: {
  flake.nixosModules.desktop = { pkgs, lib, ... }: {
    programs = {
      obs-studio.enable = true;
      obs-studio.enableVirtualCamera = true;
    };

    environment.systemPackages = [
      pkgs.mpv
    ];
  };
}
