{ config, ... }:

{

   programs.niri.settings.spawn-at-startup = [
    # { sh = "sleep 1 && dms run"; }
    # { sh = ''sleep 1 && mpvpaper -o "no-audio --loop --hwdec=vaapi --vo=dmabuf-wayland"-p DP-1 /home/ellie/Pictures/wallpapers/hornet-green-cave-hollow-knight-silksong-moewalls-com.mp4''; }
     { sh = "sleep 1 && wl-paste --watch cliphist store"; }
     { sh = "sleep 1 && steam -silent"; }
     { sh = "sleep 1 && heroic"; }
     { sh = "sleep 1 && discord"; }
   ];

}
