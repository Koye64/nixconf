{ self, inputs, ... }: {
  perSystem = { pkgs, lib, self', ... }:
  let
    myNoctalia = self'.packages.myNoctalia;
  in {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe myNoctalia)
          (lib.getExe' pkgs.udiskie "udiskie")
          [ (lib.getExe pkgs.easyeffects) "--service-mode" ]
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        cursor = {
          xcursor-theme = self.cursor.name;
          xcursor-size = self.cursor.size;
        };

        input = {
          keyboard = {
            xkb.layout = "us";
            numlock = _: {};
          };

          touchpad = {
            tap = _: {};
            natural-scroll = _: {};
          };

          mouse = {
            accel-profile = "flat";
          };

          warp-mouse-to-focus = _: {};
          focus-follows-mouse = _: {
            props = {
              max-scroll-amount = "90%";
            };
          };
          workspace-auto-back-and-forth = _: {};
        };

        overview = {
          workspace-shadow.off = _: {};
          backdrop-color = "#0f0f0f";
        };

        layout = {
          gaps = 8;
          center-focused-column = "never";

          background-color = "#000000";

          preset-column-widths = [
            { proportion = 0.25; }
            { proportion = 0.50; }
            { proportion = 0.75; }
          ];
          default-column-width.proportion = 0.5;

          focus-ring = {
            width = 2;
            active-color = "#7fc8ff";
            inactive-color = "#505050";
          };

          border = {
            off = _: {};
          };
        };

        window-rules = [
        {
          geometry-corner-radius = 12;
          clip-to-geometry = true;
        }
        {
          matches = [
            { app-id = "r#\"firefox$\""; }
            { title = "^Picture-in-Picture$"; }
          ];
          geometry-corner-radius = 0;
          clip-to-geometry = false;
          open-floating = true;
        }
        ];

        hotkey-overlay.skip-at-startup = _: {};

        binds = {
          "Mod+Shift+Slash".show-hotkey-overlay = _: {};
          "Mod+Return" = _: {
            props = {
              repeat = false;
            };
            content.spawn = lib.getExe pkgs.ghostty;
          };
          "Mod+D".spawn = [ "${lib.getExe self'.packages.myNoctalia}" "ipc" "call" "launcher" "toggle" ];
          # "Mod+Shift+L".spawn = [];

          "XF86AudioRaiseVolume" = _: {
            props = {
              allow-when-locked = true;
            };
            content = {
              spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02+ -l 1.0";
            };
          };
          "XF86AudioLowerVolume" = _: {
            props = {
              allow-when-locked = true;
            };
            content = {
              spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02-";
            };
          };
          "XF86AudioMute" = _: {
            props = {
              allow-when-locked = true;
            };
            content = {
              spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            };
          };
          "XF86AudioMicMute" = _: {
            props = {
              allow-when-locked = true;
            };
            content = {
              spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            };
          };

          "XF86AudioPlay" = _: {
            props = {
              allow-when-locked = true;
            };
            content = {
              spawn-sh = "${lib.getExe pkgs.playerctl} play-pause";
            };
          };
          "XF86AudioStop" = _: {
            props = {
              allow-when-locked = true;
            };
            content = {
              spawn-sh = "${lib.getExe pkgs.playerctl} stop";
            };
          };
          "XF86AudioPrev" = _: {
            props = {
              allow-when-locked = true;
            };
            content = {
              spawn-sh = "${lib.getExe pkgs.playerctl} previous";
            };
          };
          "XF86AudioNext" = _: {
            props = {
              allow-when-locked = true;
            };
            content = {
              spawn-sh = "${lib.getExe pkgs.playerctl} next";
            };
          };

          "XF86MonBrightnessUp" = _: {
            props = {
              allow-when-locked = true;
            };
            content = {
              spawn = [ "${lib.getExe pkgs.brightnessctl}" "--class=backlight" "set" "+10%" ];
            };
          };
          "XF86MonBrightnessDown" = _: {
            props = {
              allow-when-locked = true;
            };
            content = {
              spawn = [ "${lib.getExe pkgs.brightnessctl}" "--class=backlight" "set" "10%-" ];
            };
          };

          "Mod+W" = _: {
            props = { repeat = false; };
            content = { toggle-overview = _: {}; };
          };

          "Mod+Q".close-window = _: {};

          "Mod+Left".focus-column-left = _: {};
          "Mod+Down".focus-window-down = _: {};
          "Mod+Up".focus-window-up = _: {};
          "Mod+Right".focus-column-right = _: {};
          "Mod+H".focus-column-left = _: {};
          "Mod+J".focus-window-down = _: {};
          "Mod+K".focus-window-up = _: {};
          "Mod+L".focus-column-right = _: {};

          "Mod+Ctrl+Left".move-column-left = _: {};
          "Mod+Ctrl+Down".move-window-down = _: {};
          "Mod+Ctrl+Up".move-window-up = _: {};
          "Mod+Ctrl+Right".move-column-right = _: {};
          "Mod+Ctrl+H".move-column-left = _: {};
          "Mod+Ctrl+J".move-window-down = _: {};
          "Mod+Ctrl+K".move-window-up = _: {};
          "Mod+Ctrl+L".move-column-right = _: {};

          "Mod+Home".focus-column-first = _: {};
          "Mod+End".focus-column-last = _: {};
          "Mod+Ctrl+Home".move-column-to-first = _: {};
          "Mod+Ctrl+End".move-column-to-last = _: {};

          "Mod+Shift+Left".focus-monitor-left = _: {};
          "Mod+Shift+Down".focus-monitor-down = _: {};
          "Mod+Shift+Up".focus-monitor-up = _: {};
          "Mod+Shift+Right".focus-monitor-right = _: {};
          "Mod+Shift+H".focus-monitor-left = _: {};
          "Mod+Shift+J".focus-monitor-down = _: {};
          "Mod+Shift+K".focus-monitor-up = _: {};
          "Mod+Shift+L".focus-monitor-right = _: {};

          "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = _: {};
          "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = _: {};
          "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = _: {};
          "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = _: {};
          "Mod+Shift+Ctrl+H".move-column-to-monitor-left = _: {};
          "Mod+Shift+Ctrl+J".move-column-to-monitor-down = _: {};
          "Mod+Shift+Ctrl+K".move-column-to-monitor-up = _: {};
          "Mod+Shift+Ctrl+L".move-column-to-monitor-right = _: {};

          "Mod+Page_Down".focus-workspace-down = _: {};
          "Mod+Page_Up".focus-workspace-up = _: {};
          "Mod+N".focus-workspace-down = _: {};
          "Mod+P".focus-workspace-up = _: {};
          "Mod+Ctrl+Page_Down".move-column-to-workspace-down = _: {};
          "Mod+Ctrl+Page_Up".move-column-to-workspace-up = _: {};
          "Mod+Ctrl+N".move-column-to-workspace-down = _: {};
          "Mod+Ctrl+P".move-column-to-workspace-up = _: {};

          "Mod+Shift+Page_Down".move-workspace-down = _: {};
          "Mod+Shift+Page_Up".move-workspace-up = _: {};
          "Mod+Shift+N".move-workspace-down = _: {};
          "Mod+Shift+P".move-workspace-up = _: {};

          "Mod+WheelScrollDown" = _: {
            props = {
              cooldown-ms = 150;
            };
            content = {
              focus-workspace-down = _: {};
            };
          };
          "Mod+WheelScrollUp" = _: {
            props = {
              cooldown-ms = 150;
            };
            content = {
              focus-workspace-up = _: {};
            };
          };
          "Mod+Ctrl+WheelScrollDown" = _: {
            props = {
              cooldown-ms = 150;
            };
            content = {
              move-column-to-workspace-down = _: {};
            };
          };
          "Mod+Ctrl+WheelScrollUp" = _: {
            props = {
              cooldown-ms = 150;
            };
            content = {
              move-column-to-workspace-up = _: {};
            };
          };

          "Mod+WheelScrollRight".focus-column-right = _: {};
          "Mod+WheelScrollLeft".focus-column-left = _: {};
          "Mod+Ctrl+WheelScrollRight".move-column-right = _: {};
          "Mod+Ctrl+WheelScrollLeft".move-column-left = _: {};

          "Mod+Shift+WheelScrollDown".focus-column-right = _: {};
          "Mod+Shift+WheelScrollUp".focus-column-left = _: {};
          "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = _: {};
          "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = _: {};

          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;
          "Mod+Ctrl+1".move-column-to-workspace = 1;
          "Mod+Ctrl+2".move-column-to-workspace = 2;
          "Mod+Ctrl+3".move-column-to-workspace = 3;
          "Mod+Ctrl+4".move-column-to-workspace = 4;
          "Mod+Ctrl+5".move-column-to-workspace = 5;
          "Mod+Ctrl+6".move-column-to-workspace = 6;
          "Mod+Ctrl+7".move-column-to-workspace = 7;
          "Mod+Ctrl+8".move-column-to-workspace = 8;
          "Mod+Ctrl+9".move-column-to-workspace = 9;

          "Mod+BracketLeft".consume-or-expel-window-left = _: {};
          "Mod+BracketRight".consume-or-expel-window-right = _: {};

          "Mod+Comma".consume-window-into-column = _: {};

          "Mod+Period".expel-window-from-column = _: {};

          "Mod+R".switch-preset-column-width = _: {};
          "Mod+Shift+R".switch-preset-window-height = _: {};
          "Mod+Ctrl+R".reset-window-height = _: {};
          "Mod+F".maximize-column = _: {};
          "Mod+Shift+F".fullscreen-window = _: {};

          "Mod+M".maximize-window-to-edges = _: {};

          "Mod+Ctrl+F".expand-column-to-available-width = _: {};

          "Mod+C".center-column = _: {};

          "Mod+Ctrl+C".center-visible-columns = _: {};

          "Mod+Minus".set-column-width = "-10%";
          "Mod+Equal".set-column-width = "+10%";

          "Mod+Shift+Minus".set-window-height = "-10%";
          "Mod+Shift+Equal".set-window-height = "+10%";

          "Mod+V".toggle-window-floating = _: {};
          "Mod+Shift+V".switch-focus-between-floating-and-tiling = _: {};

          # "Mod+W".toggle-column-tabbed-display = _: {};

          "Mod+Shift+S".screenshot = _: {};
          "Mod+Shift+D".screenshot-screen = _: {};
          "Mod+Shift+W".screenshot-window = _: {};

          "Mod+Escape" = _: {
            props = {allow-inhibiting = false;};
            content = {toggle-keyboard-shortcuts-inhibit = _: {};};
          };

          "Mod+Shift+E".quit = _: {
            props = {
              skip-confirmation = true;
            };
          };
        };
      };
    };
  };
}
