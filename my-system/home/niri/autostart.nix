{ config, ... }:

{

   programs.niri.settings.spawn-at-startup = [
     { argv = ["steam" "-silent"]; }
     { argv = ["heroic"]; }
     { argv = ["discord"]; }
   ];

}
