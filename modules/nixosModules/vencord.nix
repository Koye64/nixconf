{ self, inputs, ... }: {
  flake.nixosModules.vencord = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.vesktop
      # screenshare not working
      # (pkgs.discord.override {
      #   withVencord = true;
      # })
    ];
  };
}
