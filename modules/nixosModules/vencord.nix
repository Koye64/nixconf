{ self, inputs, ... }: {
  flake.nixosModules.vencord = { pkgs, lib, ... }: {
    environment.systemPackages = [
      (pkgs.discord.override {
        withVencord = true;
      })
    ];
  };
}
