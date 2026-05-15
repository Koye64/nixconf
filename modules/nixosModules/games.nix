{ self, inputs, ... }: {
  flake.nixosModules.games = { pkgs, lib, ... }: {
    programs = {
      steam = {
        enable = true;
        extraPackages = with pkgs; [
          gamescope
        ];
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
      };
    };

    environment.systemPackages = [
      pkgs.dolphin-emu
      pkgs.itch
      pkgs.tetrio-desktop
      self.packages.${pkgs.stdenv.hostPlatform.system}.ryubing
    ];
  };
}
