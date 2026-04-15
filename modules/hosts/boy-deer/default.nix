{ self, inputs, ... }: {
  flake.nixosConfigurations.boy-deer = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.boyDeerConfiguration
      self.nixosModules.myHomeManager
      { home-manager.users.koye = self.homeModules.koyeModule; }
    ];
  };

  # standalone
  # flake.homeConfigurations.koye = inputs.home-manager.lib.homeManagerConfiguration {
  #   pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
  #   modules = [
  #     self.homeModules.koyeModule
  #     {
  #       home.username = "koye";
  #       home.homeDirectory = "/home/koye";
  #     }
  #   ];
  # };
}
