{ config, ... }:

{

   programs.niri.settings.spawn-at-startup = [
     { sh = "steam -silent"; }
     { argv = "heroic"; }
     { argv = "discord"; }
   ];

}
