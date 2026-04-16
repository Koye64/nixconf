{ self, inputs, ... }: {
  flake.nixosModules.hummingbird = { pkgs, lib, ... }: {
    environment.systemPackages = [
      inputs.hummingbird-player.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}

