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
      # pkgs.ryubing
      pkgs.itch
      self.packages.${pkgs.stdenv.hostPlatform.system}.ryujinxRunner
      ( pkgs.makeDesktopItem {
        name = "ryujinx-runner";
        desktopName = "Ryujinx Runner";
        exec = lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.ryujinxRunner;
        icon = "ryujinx";
        categories = [ "Game" ];
      })
    ];
  };
}
