{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
	 (lib.getExe self'.packages.myNoctalia)
	];

	xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

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

	layout = {
	  gaps = 8;
	  center-focused-column = "never";

	  preset-column-widths = [
	    { proportion = 0.25; }
	    { proportion = 0.50; }
	    { proportion = 0.75; }
	  ];
          default-column-width.proportion = 0.5;

          focus-ring = {
	    width = 4;
	    active-color = "#7fc8ff";
	    inactive-color = "#505050";
	  };

	  border = {
	    off = _: {};
	  };
	};

        window-rule = {
	  geometry-corner-radius = 12;
	  clip-to-geometry = true;
	};

	binds = {
	  "Mod+Shift+Slash".show-hotkey-overlay = _: {};
	  "Mod+Return" = _: {
	    props = {
	      repeat = false;
	    };
	    content.spawn = lib.getExe pkgs.ghostty;
	  };
	  "Mod+Q".close-window = _: {};
	  # Program launcher
	  "Mod+D".spawn = [ "${lib.getExe self'.packages.myNoctalia}" "ipc" "call" "launcher" "toggle" ];
	  # Lock screen
	  # "Mod+Shift+L".spawn = [];

          "Mod+Shift+S".screenshot = _: {};
	  "Mod+Shift+W".screenshot-window = _: {};
	  "Mod+Shift+D".screenshot-screen = _: {};

	  "Mod+Escape" = _: {
	    props = {allow-inhibiting = false;};
	    content = {toggle-keyboard-shortcuts-inhibit = _: {};};
	  };

	  "Mod+WheelScrollDown".focus-workspace-down = _: {};
	  "Mod+WheelScrollUp".focus-workspace-up = _: {};
	  "Mod+WheelScrollRight".focus-column-right = _: {};
	  "Mod+WheelScrollLeft".focus-column-left = _: {};

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
