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
}
