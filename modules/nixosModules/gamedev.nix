{ self, inputs, ... }: {
  flake.nixosModules.gamedev = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      godotPackages_4_6.godot
      (blender.override {
        rocmSupport = true;
      })
      unityhub
      p7zip # required for unityhub
      alcom
      krita
    ];
  };
}
