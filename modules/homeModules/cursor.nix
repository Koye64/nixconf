{ self, inputs, ... }: {
  flake.homeModules.cursor = { pkgs, ... }: {
    home.pointerCursor = {
      enable = true;
      dotIcons.enable = false;
      gtk.enable = true;
      x11.enable = true;
      size = 24;
      package = pkgs.bibata-cursors;
      name = "Bibata Modern";
    };
  };
}
