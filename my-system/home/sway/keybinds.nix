{ config, lib, ... }:

{
 
  wayland.windowManager.sway.config = {
      modifier = "Mod4";
      keybindings = lib.attrsets.mergeAttrsList [
        (lib.attrsets.mergeAttrsList (map (num: let
          ws = toString num;
        in {
          "Mod4+${ws}" = "workspace ${ws}";
          "Mod4+Shift+${ws}" = "move container to workspace ${ws}";
        }) [1 2 3 4 5 6 7 8 9 0]))

        (lib.attrsets.concatMapAttrs (key: direction: {
            "Mod4+${key}" = "focus ${direction}";
            "Mod4+Ctrl+${key}" = "move ${direction}";
          }) {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
          })

        {
          "Mod4+t" = "exec --no-startup-id app2unit -- ghostty";
	  "Mod4+e" = "exec --no-startup-id app2unit -- dolphin";

          "Mod4+Super_L" = "exec --no-startup-id noctalia-shell ipc call launcher toggle";
	  "Mod4+d" = "exec --no-startup-id noctalia-shell ipc call controlCenter toggle";
	  "Mod4+s" = "exec --no-startup-id noctalia-shell ipc call settings toggle";
	  "Mod4+w" = "exec --no-startup-id noctalia-shell ipc call wallpaper toggle";
	  "Mod4+r" = "exec --no-startup-id noctalia-shell ipc call screenRecorder toggle";
	  "Mod4+Shift+c" = "exec --no-startup-id noctalia-shell ipc call launcher clipboard";
	  "Mod4+Shift+e" = "exec --no-startup-id noctalia-shell ipc call sessionMenu toggle";
	  "Mod4+Shift+r" = "exec --no-startup-id systemctl --user restart noctalia-shell";

          "Mod4+q" = "kill";

          "Mod4+f" = "fullscreen toggle";

          "Mod4+Shift+s" = "exec swaymsg reload";
          "Mod4+p" = "exec --no-startup-id hyprshot -m region swappy";
	  "Mod4+Shift+p" = "exec --no-startup-id hyprshot -m output";
        }
      ];
  };

}



