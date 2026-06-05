{ self, inputs, ... }: {
  flake.nixosModules.desktop = { pkgs, lib, ... }: {
    programs = {
      obs-studio.enable = true;
      obs-studio.enableVirtualCamera = true;
      obs-studio.plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-vaapi
        obs-gstreamer
        obs-vkcapture
        obs-pipewire-audio-capture
      ];
    };

    qt.enable = true;
    qt.style = null;

    environment.systemPackages = [
      pkgs.audacity
      pkgs.mpv
      pkgs.keepassxc
    ];
  };
}
