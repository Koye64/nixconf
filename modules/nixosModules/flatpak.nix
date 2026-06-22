{ self, inputs, ... }: {
  flake.nixosModules.flatpak = { config, pkgs, lib, ... }: {
    services.flatpak.enable = true;
    environment.systemPackages = with pkgs; [
      bazaar
    ];
  };
}
