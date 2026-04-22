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

    environment.systemPackages = with pkgs; [
      pkgs.ryubing
      pkgs.itch
    ];
  };
}
