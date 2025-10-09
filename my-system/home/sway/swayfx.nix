{ config, ... }:

{

  wayland.windowManager.sway.extraConfig = ''
    blur enable
    blur_passes 2
    blur_radius 2
    corner_radius 4
  '';

}
    
