{ config, lib, pkgs, inputs, ... }:

{

  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 


    wayland = {
      windowManager = {
        hyprland = {
	  enable = true;
          xwayland.enable = true;
          systemd = {
            enable = true;
            variables = [
            "--all"
            ];
	  };
	  plugins = [
            inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
          ];
	  settings = {
            monitorv2 = {
	      output = "DP-1";
	      mode = "1920x1080@239.96";
	      scale = 1;
	      position = "0x0";
	      vrr = 2;
	    };

            input = {
              kb_layout = "br";
            };

            general = {
              border_size = 4;
	      gaps_in = 6;
	      gaps_out = 16;
	      "col.active_border" = lib.mkForce "rgb(203,166,247)";
	      layout = "scrolling";
	      allow_tearing = true;
            };

	    plugin = {
	      hyprscrolling = {
	        fullscreen_on_one_column = true;
	      };
	    };

            misc = {
              vrr = 2;
              vfr = false;
            };

	    render = {
	      direct_scanout = 2;
	    };

            decoration = {
              rounding = 5;
	      rounding_power = 4.0;
	      active_opacity = 0.95;
	      inactive_opacity = 0.95;
	      fullscreen_opacity = 1.0;
              blur = {
                size = 2;
	        passes = 2;
              };
	    };

            animations = {
              bezier = [
	        "expressiveFastSpatial, 0.42, 1.67, 0.21, 0.90"
                "expressiveSlowSpatial, 0.39, 1.29, 0.35, 0.98"
                "expressiveDefaultSpatial, 0.38, 1.21, 0.22, 1.00"
                "emphasizedDecel, 0.05, 0.7, 0.1, 1"
                "emphasizedAccel, 0.3, 0, 0.8, 0.15"
                "standardDecel, 0, 0, 0, 1"
                "menu_decel, 0.1, 1, 0, 1"
                "menu_accel, 0.52, 0.03, 0.72, 0.08"
              ];
              animation = [
	        "windowsIn, 1, 3, emphasizedDecel, popin 80%"
                "windowsOut, 1, 2, emphasizedDecel, popin 90%"
                "windowsMove, 1, 3, emphasizedDecel, slide"
                "border, 1, 10, emphasizedDecel"
                   # layers
                "layersIn, 1, 2.7, emphasizedDecel, popin 93%"
                "layersOut, 1, 2.4, menu_accel, popin 94%"
                   # fade
                "fadeLayersIn, 1, 0.5, menu_decel"
                "fadeLayersOut, 1, 2.7, menu_accel"
                   # workspaces
                "workspaces, 1, 7, menu_decel, slide"
                   # specialWorkspace
                "specialWorkspaceIn, 1, 2.8, emphasizedDecel, slidevert"
                "specialWorkspaceOut, 1, 1.2, emphasizedAccel, slidevert"
              ];
	    };
           };
	 };
       };  
    };

}
