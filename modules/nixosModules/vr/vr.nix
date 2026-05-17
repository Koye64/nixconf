{ self, inputs, ... }: {
  flake.nixosModules.vr = { pkgs, lib, ... }: {
    services = {
      wivrn = {
        enable = true;
        openFirewall = true;
        autoStart = true;
        config = {
          enable = true;
          json = (lib.mapAttrsRecursive (_: lib.mkDefault) (lib.importJSON ./config.json)) // {
            application = with pkgs; [
              wayvr
            ];
          };
        };
        steam = {
          enable = true;
          importOXRRuntimes = true;
        };
      };
    };
    environment.systemPackages = with pkgs; [
      wayvr
    ];
  };
}
