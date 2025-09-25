{ config, ... }:

{

   programs.niri.settings.spawn-at-startup = [
     { sh = "wl-paste --watch cliphist store"; }
     { sh = "steam -silent"; }
     { argv = ["heroic"]; }
     { argv = ["discord"]; }
   ];

}
