{ config, ... }:

{

  wayland.windowManager.sway.config = rec {
    startup = [
      { command = "wl-paste --watch cliphist store"; }
      { command = "steam -silent"; }
      { command = "heroic"; }
      { command = "discord"; }
    ];
  };

}
