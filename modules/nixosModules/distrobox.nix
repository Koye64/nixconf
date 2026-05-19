{ self, inputs, ... }: {
  flake.nixosModules.distrobox = { pkgs, lib, ... }: {
    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
    users.users.koye.extraGroups = [ "podman" ];
    environment.systemPackages = with pkgs; [
      distrobox
    ];
  };
}
