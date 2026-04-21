{ self, inputs, ... }: {
  flake.homeModules.koyeModule = { pkgs, ... }: {
    imports = [
      self.homeModules.cursor
      self.homeModules.niri
      self.homeModules.dms
    ];
    home.stateVersion = "26.05";
  };
}
