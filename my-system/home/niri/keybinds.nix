{ config, lib, pkgs, ... }:

let
  noctalia = cmd: [
    "noctalia-shell" "ipc" "call"
  ] ++ (pkgs.lib.splitString " " cmd);
in
{

   programs.niri.settings.binds = with config.lib.niri.actions; { 
     "Mod+A".action.spawn = noctalia "launcher toggle";
     "Mod+T".action = spawn "sh" "-c" ''ghostty'';
     "Mod+E".action = spawn "sh" "-c" ''cosmic-files'';
     "Mod+W".action.spawn = noctalia "wallpaper toggle";
     "Mod+D".action.spawn = noctalia "controlCenter toggle";
     "Mod+Shift+C".action.spawn = noctalia "launcher clipboard";
     "Mod+Shift+E".action.spawn = noctalia "sessionMenu toggle";
     "Mod+Shift+R".action = spawn "sh" "-c" ''systemctl --user restart noctalia-shell'';

     "Mod+P".action = screenshot;
     "Mod+Shift+P".action = screenshot-window;

     "Mod+Q".action = close-window;
     "Mod+F".action = maximize-column;
     "Mod+Shift+F".action = fullscreen-window;
     "Mod+V".action = toggle-window-floating;

     "Mod+J".action = focus-column-left;
     "Mod+K".action = focus-window-down;
     "Mod+I".action = focus-window-up;
     "Mod+L".action = focus-column-right;

     "Mod+1".action = focus-workspace 1;
     "Mod+2".action = focus-workspace 2;
     "Mod+3".action = focus-workspace 3;
     "Mod+4".action = focus-workspace 4;
     "Mod+5".action = focus-workspace 5; 
     "Mod+6".action = focus-workspace 6;
     "Mod+7".action = focus-workspace 7;
     "Mod+8".action = focus-workspace 8;
     "Mod+9".action = focus-workspace 9;
  };

}
