{ self, inputs, ... }: {
  flake.nixosModules.appimage = { pkgs, lib, ... }: {
    programs.appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: [
          pkgs.icu
        ];
      };
    };
  };
}
