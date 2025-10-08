{ config, lib, ... }:

{
 
  wayland.windowManager.sway.config = {
      modifier = "Mod4";
      keybindings = 
      let
         modifier = config.wayland.windowManager.sway.config.modifier;
      in lib.mkOptionDefault 
       {
          "${modifier}+1" = "workspace 1";
	  "${modifier}+2" = "workspace 2";
	  "${modifier}+3" = "workspace 3";
	  "${modifier}+4" = "workspace 4";
          "${modifier}+5" = "workspace 5";
	  "${modifier}+6" = "workspace 6";
	  "${modifier}+7" = "workspace 7";
	  "${modifier}+8" = "workspace 8";
	  "${modifier}+9" = "workspace 9";

          "${modifier}+t" = "exec --no-startup-id app2unit -- ghostty";
	  "${modifier}+e" = "exec --no-startup-id app2unit -- dolphin";

          "${modifier}+a" = "exec --no-startup-id noctalia-shell ipc call launcher toggle";
	  "${modifier}+d" = "exec --no-startup-id noctalia-shell ipc call controlCenter toggle";
	  "${modifier}+s" = "exec --no-startup-id noctalia-shell ipc call settings toggle";
	  "${modifier}+w" = "exec --no-startup-id noctalia-shell ipc call wallpaper toggle";
	  "${modifier}+r" = "exec --no-startup-id noctalia-shell ipc call screenRecorder toggle";
	  "${modifier}+Shift+c" = "exec --no-startup-id noctalia-shell ipc call launcher clipboard";
	  "${modifier}+Shift+e" = "exec --no-startup-id noctalia-shell ipc call sessionMenu toggle";
	  "${modifier}+Shift+r" = "exec --no-startup-id systemctl --user restart noctalia-shell";

          "${modifier}+q" = "kill";

          "${modifier}+f" = "fullscreen toggle";

          "${modifier}+Shift+s" = "exec swaymsg reload";
          "${modifier}+p" = "exec --no-startup-id hyprshot -m region swappy";
	  "${modifier}+Shift+p" = "exec --no-startup-id hyprshot -m output";
        };
  };

}



