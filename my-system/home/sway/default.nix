{ config, lib, ... }:

{

  imports = [
    ./general.nix
    ./startup.nix
    ./keybinds.nix
    ./swayfx.nix
  ];

}
