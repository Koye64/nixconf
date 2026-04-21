{ self, inputs, ... }: {
  flake.nixosModules.dms = { pkgs, lib, ... }: {
    imports = [
      inputs.dms.nixosModules.greeter
    ];

    programs.dank-material-shell.greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = "/home/koye";
    };

    systemd.user.services.niri-flake-polkit.enable = false;
  };
}
