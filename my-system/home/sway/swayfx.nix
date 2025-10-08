{ config, ... }:

{

  wayland.windowManager.sway.extraConfig = ''
    blur enable
    blur_passes 2
    blur_radius 3
    corner_radius 6
  '';

}
    
