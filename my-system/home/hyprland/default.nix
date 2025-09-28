{ config, self, ... }:

{
 
   imports = [
     ./general.nix
     ./auto-start.nix
     ./keybinds.nix
     ./window-rules.nix
   ];

}
