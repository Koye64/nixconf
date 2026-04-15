{ self, inputs, ... }: {
  flake.nixosConfigurations.boy-deer = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.boyDeerConfiguration
    ];
  };

  flake.homeConfigurations.koye = inputs.home-manager.lib.homeManagerConfiguration {
    # pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.koyeModule
      {
        home.username = "koye";
        home.homeDirectory = "/home/koye";
      }
    ];
  };
}
