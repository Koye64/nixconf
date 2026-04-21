{ self, inputs, ... }: {
  flake.homeModules.dms = { pkgs, ... }: {
    imports = [
      inputs.dms.homeModules.dank-material-shell
      # dependent on niri flake
      inputs.dms.homeModules.niri
    ];

    programs.niri.settings.binds = {
      "Mod+D".action.spawn = [ "dms" "ipc" "launcher" "toggle" ];
      "Mod+E".action.spawn = [ "dms" "ipc" "powermenu" "toggle" ];
    };

    xdg.configFile."DankMaterialShell/themes".source = ./themes;

    programs.dank-material-shell = {
      enable = true;

      settings = (builtins.fromJSON
        (builtins.readFile ./settings.json)
      );
      session = (builtins.fromJSON
        (builtins.readFile ./session.json)
      );

      niri = {
        includes.enable = true;
        enableKeybinds = false;
        enableSpawn = false;
      };

      systemd = {
        enable = true;
        restartIfChanged = true;
      };

      enableSystemMonitoring = true;
      enableVPN = false;
      enableDynamicTheming = false;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
      enableClipboardPaste = true;
    };
  };
}
