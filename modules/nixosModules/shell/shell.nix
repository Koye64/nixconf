{ self, inputs, ... }: {
  flake.nixosModules.shell = { pkgs, lib, ... }: {
    programs.zsh.enable = true;
    users.users.koye.shell = pkgs.zsh;
    environment.variables = {
      # EDITOR = lib.getExe self'.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
      # VISUAL = lib.getExe self'.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
      EDITOR = lib.getExe pkgs.neovim;
      VISUAL = lib.getExe pkgs.neovim;
    };
    environment.systemPackages = with pkgs; [
      nh

      fastfetch
      hyfetch

      file
      zip
      unzip
      fzf
      eza

      git
      lazygit

      imagemagick

      neovim
    ];

    programs.zsh = {
      syntaxHighlighting.enable = true;
      autosuggestions = {
        enable = true;
        strategy = [ "completion" "history" ];
      };
      enableBashCompletion = true;
    };

    environment.shellAliases = {
      l = null;
      ls = "eza --icons=auto";
      ll = "ls -l";
      la = "ll -a";
      lt = "ls --tree";

      lg = "lazygit";
    };

    programs.starship = {
      enable = true;
      transientPrompt.enable = true;
      settings = (builtins.fromTOML
        (builtins.readFile ./starship.toml)
      );
      presets = [ "nerd-font-symbols" "pure-preset" ];
    };
  };
}
