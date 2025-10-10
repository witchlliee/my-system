{ config, ... }:

{

  wayland.windowManager.sway.extraConfig = ''
    blur enable
    blur_passes 2
    blur_radius 2
    corner_radius 4

    bindsym --release Super_L exec --no-startup-id noctalia-shell ipc call launcher toggle
  '';

}
    
