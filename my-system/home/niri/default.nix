{ config, lib, ... }:

{
 
   imports = [
     ./general.nix
     ./autostart.nix
     ./keybinds.nix
     ./window-rules.nix
   ];

}
