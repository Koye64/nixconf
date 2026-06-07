{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    nixpkgs.overlays = [
      inputs.niri.overlays.niri
    ];

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common.default = [ "gnome" ];
      };
    };
    services.dbus.implementation = "broker";
    services.udisks2.enable = true;
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
    programs.seahorse.enable = true;

    programs.niri.enable = true;
    programs.niri.package = pkgs.niri-unstable;

    qt.enable = true;
    qt.style = "breeze";

    environment.systemPackages = with pkgs; [
      nautilus
      mpv
      imv
      easyeffects
      wl-clipboard
      libsecret
    ];
  };
}
