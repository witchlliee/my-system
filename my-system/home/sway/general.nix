{ config, lib, pkgs, ... }:

{

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    checkConfig = false;
    config = {
      output = {
        "DP-1" = {
	   mode = "1920x1080@239.96Hz";
	   adaptive_sync = "off";
	   allow_tearing = "yes";
	   max_render_time = "off";
	   pos = "0 0";
        };
      };

      input = {
        "*" = {
	  xkb_layout = "br";
        };
      };

      gaps = {
        inner = 16;
	outer = 12;
      };

      colors = {
        focused = lib.mkForce {
	  background = "#cba6f7";
          border = "#cba6f7";
          childBorder = "#cba6f7";
          indicator = "#cba6f7";
          text = "#cba6f7";
        };
      };

      bars = [ ];

      floating = {
        border = 4;
	titlebar = false;
      };

      window = {
        border = 4;
	titlebar = false;
	commands = [
	  {
	    command = "border pixel 4";
	    criteria = {
              all = true;  
	    };
	  }
	  {
	    command = "opacity 0.93";
	    criteria = {
	      all = true;
	    };
	  }
        ];
      };
    };
  };

}
  

    
