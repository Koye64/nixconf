{ self, inputs, ... }: {
  flake.nixosConfigurations.boy-deer = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.boyDeerConfiguration
    ];
  };
}
