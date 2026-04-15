{ self, inputs, ... }: {
  flake.homeConfigurations.koye = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.koyeModule
      {
        home.username = "koye";
        home.homeDirectory = "/home/koye";
      }
    ];
  };

  flake.homeModules.koyeModule = { pkgs, ... }: {
    # imports = [ ... ]
  };
}
