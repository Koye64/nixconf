{ self, inputs, ... }: {
  flake.homeModules.cava = { pkgs, lib, ... }: {
    programs.cava = {
      enable = true;
      settings = {
        general.framerate = 280;
        smoothing.noise_reduction = 12;
      };
    };
  };
}
