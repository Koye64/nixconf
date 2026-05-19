{ self, inputs, ... }: {
  flake.nixosModules.programming = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      rustup
      gcc
    ];
  };
}

