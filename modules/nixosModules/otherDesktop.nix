{ self, inputs, ... }: {
  flake.nixosModules.otherDesktop = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.element-desktop
    ];
  };
}
