{ config, ... }:

{

   wayland.windowManager.hyprland.settings = {
     exec-once = [
       ''mpvpaper -o "no-audio --loop --hwdec=vaapi --vo=dmabuf-wayland"-p DP-1 /home/ellie/Pictures/wallpapers/hornet-green-cave-hollow-knight-silksong-moewalls-com.mp4''
       "wl-paste --watch cliphist store"
       "app2unit -- steam-silent"
       "app2unit -- heroic"
       "app2unit -- discord"
     ];
   };

}
