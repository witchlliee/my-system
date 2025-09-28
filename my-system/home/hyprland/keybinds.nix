{ config, ... }:

{

    wayland.windowManager.hyprland.settings = {
        "$mod" = "SUPER";
      bind =
       [
        "$mod, T, exec, app2unit -- ghostty"
	"$mod, E, exec, app2unit -- dolphin"
	
	"$mod, Q, killactive,"
	"$mod, V, togglefloating"
	"$mod, F, fullscreen"
	"$mod, J, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, I, movefocus, u"
	"$mod, K, movefocus, d"

	"$mod, P, screenshot region"
	"$mod SHIFT, P, screenshot monitor"
	"$mod CTRL, P, screenshot region swappy"
       ]
         ++ (
           # workspaces
           # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
    };

}
