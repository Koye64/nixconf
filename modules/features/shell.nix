{ self, inputs, ... }: {
  flake.nixosModules.shell = { pkgs, lib, ... }: {
    programs.zsh.enable = true;
    environment.pathsToLink = [ "/share/zsh" ];
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myShell
    ];
    environment.variables = {
      # EDITOR = lib.getExe self'.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
      # VISUAL = lib.getExe self'.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
      EDITOR = lib.getExe pkgs.neovim;
      VISUAL = lib.getExe pkgs.neovim;
    };
    users.users.koye.shell = self.packages.${pkgs.stdenv.hostPlatform.system}.myShell;
  };

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
