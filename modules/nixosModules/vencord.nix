{ self, inputs, ... }: {
  flake.nixosModules.vencord = { pkgs, lib, ... }: {
    environment.systemPackages = [
      (pkgs.discord-canary.override {
        withVencord = true;
      })
    ];
  };
}
