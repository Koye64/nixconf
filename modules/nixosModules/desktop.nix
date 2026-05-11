{ self, inputs, ... }: {
  flake.nixosModules.desktop = { pkgs, lib, ... }: {
    programs = {
      obs-studio.enable = true;
      obs-studio.enableVirtualCamera = true;
      obs-studio.plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
      ];
    };

    environment.systemPackages = [
      pkgs.mpv
    ];
  };
}
