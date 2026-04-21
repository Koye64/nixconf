{ self, inputs, ... }: {
  flake.homeModules.koyeModule = { pkgs, ... }: {
    imports = with self.homeModules; [
      cursor
      niri
      dms
      catppuccin
      cava
    ];
    home.stateVersion = "26.05";

    programs.ghostty = {
      enable = true;
    };

    programs.bat = {
      enable = true;
    };
  };
}
