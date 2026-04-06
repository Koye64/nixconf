{ self, inputs, ... }: {
  flake.nixosModules.vencord = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.vencord
    ];
  };
}
