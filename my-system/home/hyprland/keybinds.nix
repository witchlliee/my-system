{ config, ... }:

{

    wayland.windowManager.hyprland.settings = {
        "$mod" = "SUPER";
      bind =
       [
        "$mod, Super_L, exec, noctalia-shell ipc call launcher toggle"
	"$mod, W, exec, noctalia-shell ipc call wallpaper toggle"
	"$mod, D, exec, noctalia-shell ipc call controlCenter toggle"
	"$mod, S, exec, noctalia-shell ipc call settings toggle"
	"$mod, C, exec, noctalia-shell ipc call launcher calculator"
	"$mod SHIFT, C, exec, noctalia-shell ipc call launcher clipboard"
	"$mod SHIFT, E, exec, noctalia-shell ipc call sessionMenu toggle"
	"$mod SHIFT, R, exec, systemctl --user restart noctalia-shell"

        "$mod, T, exec, app2unit -- ghostty"
	"$mod, E, exec, app2unit -- dolphin"
	
	"$mod, Q, killactive,"
	"$mod, V, togglefloating"
	"$mod, F, fullscreen, 1"
	"$mod SHIFT, F, fullscreen, 0"
	"$mod, J, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, I, movefocus, u"
	"$mod, K, movefocus, d"

	"$mod, P, exec, hyprshot -m region"
	"$mod SHIFT, P, exec, hyprshot -m output"
	"$mod CTRL, P, exec, hyprshot -m region swappy"
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
