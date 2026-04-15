{ self, inputs, ... }: {
  flake.nixosModules.steam = { pkgs, lib, ... }: {
    programs = {
      steam = {
        enable = true;
        extraPackages = with pkgs; [
          gamescope
        ];
      };
    };
  };
}
