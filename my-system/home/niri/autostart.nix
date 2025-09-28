{ config, ... }:

{

   programs.niri.settings.spawn-at-startup = [
     { sh = "sleep 1 && wl-paste --watch cliphist store"; }
     { sh = "sleep 1 && steam -silent"; }
     { sh = "sleep 1 && heroic"; }
     { command = ["discord"]; }
   ];

}
