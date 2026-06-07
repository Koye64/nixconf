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

    environment.systemPackages = [
      pkgs.audacity
      pkgs.puddletag
      pkgs.keepassxc
    ];
  };
}
