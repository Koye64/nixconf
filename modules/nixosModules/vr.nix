{ self, inputs, ... }: {
  flake.nixosModules.vr = { pkgs, lib, ... }: {
    services = {
      wivrn = {
        enable = true;
        openFirewall = true;
        autoStart = true;
        highPriority = true;
        steam = {
          enable = true;
          importOXRRuntimes = true;
        };
      };
    };
  };
}
