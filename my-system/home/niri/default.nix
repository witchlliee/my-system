{ config, lib, ... }:

{
 
   imports = [
     ./general.nix
     ./autostart.nix
     ./keybinds.nix
     ./windowrules.nix
   ];

}
