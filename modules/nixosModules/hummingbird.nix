{ self, inputs, ... }: {
  flake.nixosModules.hummingbird = { pkgs, lib, ... }: {
    environment.systemPackages = [
      inputs.hummingbird.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}

