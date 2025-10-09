{ config, ... }:

{

  wayland.windowManager.sway.config = rec {
    startup = [
      { command = "papersway"; }
      { command = "/home/ellie/my-nix/my-system/home/sway/scripts/vrr_fullscreen.sh"; }
      { command = "wl-paste --watch cliphist store"; }
      { command = "app2unit -- steam -silent"; }
      { command = "app2unit -- heroic"; }
      { command = "app2unit -- discord"; }
    ];
  };

}
