{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = lib.mkDefault self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };

    services.dbus.implementation = "broker";

    services.udisks2.enable = true;

    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

    environment.systemPackages = [
      pkgs.ghostty
      pkgs.nautilus
      pkgs.easyeffects
    ];
  };
}
