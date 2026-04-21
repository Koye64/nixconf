{ self, inputs, ... }: {
  flake.homeModules.catppuccin = { pkgs, lib, ... }: {
    imports = [
      inputs.catppuccin.homeModules.catppuccin
    ];

    catppuccin = {
      accent = "mauve";
      flavor = "mocha";
      cache.enable = true;

      bat.enable = true;
      cava.enable = true;
      ghostty.enable = true;
    };
  };
}
