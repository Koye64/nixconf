{ self, inputs, ... }: {
  flake.nixosModules.games = { pkgs, lib, ... }: {
    programs = {
      steam = {
        enable = true;
        extraPackages = with pkgs; [
          gamescope
        ];
      };
    };

    environment.systemPackages = [
      pkgs.itch
      self.packages.${pkgs.stdenv.hostPlatform.system}.ryubing
    ];
  };
}
