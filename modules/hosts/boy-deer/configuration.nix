{ self, inputs, ... }: {
  flake.nixosModules.boyDeerConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.boyDeerHardware
      self.nixosModules.shell
      self.nixosModules.niri
      self.nixosModules.vencord
      self.nixosModules.steam
      self.nixosModules.hummingbird
      self.nixosModules.syncthing
      self.nixosModules.dms
    ];

    environment.systemPackages = [
      pkgs.godotPackages_4_6.godot
      (pkgs.blender.override {
        rocmSupport = true;
      })
    ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "boy-deer"; # Define your hostname.

      networking.networkmanager.enable = true;

    time.timeZone = "America/Phoenix";

    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
      useXkbConfig = false; # use xkb.options in tty.
    };

    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };

    services.libinput.enable = true;

    users.users.koye = {
      description = "Koye";
      isNormalUser = true;
      hashedPassword = "$y$j9T$TO9.QgDIlS8ev.Oj51y.y.$hSYCWzfa7eHLnIBUHQYaSOOoZWjL6WuZnVpxCk9uWZC";
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };

    programs.fish.enable = true;

    programs.firefox.enable = true;

    programs.mtr.enable = true;
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    services.openssh.enable = true;

    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
