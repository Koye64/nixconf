{ self, inputs, ... }: {
  flake.nixosModules.dms = { pkgs, lib, ... }: {
    imports = [
      inputs.dms.nixosModules.dank-material-shell
    ];

    programs.dank-material-shell = {
      enable = true;
      enableSystemMonitoring = true;
    };
  };
}
