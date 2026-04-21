{ self, inputs, ... }: {
  flake.nixosModules.catppuccin = { pkgs, lib, ... }: {
    imports = [
      inputs.catppuccin.nixosModules.catppuccin
    ];

    catppuccin = {
      accent = "mauve";
      flavor = "mocha";
      cache.enable = true;

      gtk.icon.enable = true;
      limine.enable = true;
      tty.enable = true;
    };
  };
}
