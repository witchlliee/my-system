{ config, ... }:

{

   wayland.windowManager.hyprland.settings = {
     exec-once = [
       "wl-paste --watch cliphist store"
       "app2unit -- steam -silent"
       "app2unit -- heroic"
       "app2unit -- discord"
     ];
   };

}
