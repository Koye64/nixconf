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

    environment.systemPackages = with pkgs; [
      dolphin-emu
      itch
      prismlauncher
      tetrio-desktop
      self.packages.${stdenv.hostPlatform.system}.ryubing
    ];
  };
}
