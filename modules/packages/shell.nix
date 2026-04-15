{ self, inputs, ... }: {
  perSystem = { pkgs, lib, self', ... }: {
    packages.myShell = inputs.wrapper-modules.wrappers.zsh.wrap {
      inherit pkgs;

      extraPackages = [
        # nix
        # self'.packages.nh
        pkgs.nh

        # utilities
        pkgs.file
        pkgs.zip
        pkgs.unzip
        pkgs.fzf
        # self'.packages.git
        pkgs.git
        pkgs.lazygit
        # self'.packages.btop
        pkgs.imagemagick
        # self'.packages.fastfetch

        # self'.packages.neovim
        pkgs.neovim
      ];

      zshAliases = {
        ls = "${lib.getExe pkgs.eza} --icons=auto";
        ll = "ls -lh";
        la = "ll -A";
        lt = "ls --tree";
        lg = "lazygit";
      };
    };
  };
}
