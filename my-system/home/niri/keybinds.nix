{ config, lib, pkgs, ... }:
let
  noctalia = noctalia-shell ipc call;
in

let
  noctalia = cmd: [
    "noctalia-shell" "ipc" "call"
  ] ++ (pkgs.lib.splitString " " cmd);
in
{

   programs.niri.settings.binds = with config.lib.niri.actions; { 
     "Mod+A".action.spawn = noctalia "launcher toggle";
     "Mod+T".action = spawn "sh" "-c" ''app2unit -T'';
     "Mod+E".action = spawn "sh" "-c" ''app2unit -- dolphin'';
     "Mod+W".action.spawn = noctalia "wallpaper toggle";
     "Mod+D".action.spawn = noctalia "wallpaper toggle";
     "Mod+Shift+C".action.spawn = noctalia "launcher clipboard";
     "Mod+Shift+E".action.spawn = noctalia "powerPanel toggle";

     "Mod+Q".action = close-window;

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
     "Mod+Shift+1".action = move-column-to-workspace 1;
     "Mod+Shift+2".action = move-column-to-workspace 2;
     "Mod+Shift+3".action = move-column-to-workspace 3;
     "Mod+Shift+4".action = move-column-to-workspace 4;
     "Mod+Shift+5".action = move-column-to-workspace 5;
     "Mod+Shift+6".action = move-column-to-workspace 6;
     "Mod+Shift+7".action = move-column-to-workspace 7;
     "Mod+Shift+8".action = move-column-to-workspace 8;
     "Mod+Shift+9".action = move-column-to-workspace 9;
  };

}
