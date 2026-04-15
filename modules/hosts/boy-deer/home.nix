{ self, inputs, ... }: {
  flake.homeModules.koyeModule = { pkgs, ... }: {
    imports = [
      self.homeModules.cursor
    ];
    home.stateVersion = "26.05";
  };
}
