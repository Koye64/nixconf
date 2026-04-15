{ self, inputs, ... }: let
  size = 28;
  name = "Bibata-Modern-Classic";
in {
  flake.homeModules.cursor = { pkgs, ... }: {
    home.pointerCursor = {
      enable = true;
      dotIcons.enable = false;
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      inherit name;
      inherit size;
    };
  };

  flake.cursor = { inherit size; inherit name; };
}
