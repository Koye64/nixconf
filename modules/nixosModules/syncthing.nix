{ self, inputs, ... }: {
  flake.nixosModules.syncthing = {
    services.syncthing = {
      enable = true;
      dataDir = "/home/koye";
      user = "koye";
      # If one day I go crazy, like, REALLY crazy, I'll declaratively define 
      # the rest of this config.
    };
  };
}
