{ config, ... }:

{
 
   wayland.windowManager.hyprland.settings = {
     windowrule = [
          # applications
       "float, class:^(org.kde.dolphin)$"
       "float, class:^(com.vysp3r.ProtonPlus)$"

          # dialogs
       "float, title:(Select|Open)( a)? (File|Folder)(s)?"
       "float, title:File (Operation|Upload)( Progress)?"
       "float, title:.* Properties"
       "float, title:Export Image as PNG"
       "float, title:GIMP Crash Debug"
       "float, title:Save As"
       "float, title:Library"

          # gaming
       "immediate, class:^(.*\\.exe)$"
       "immediate, class:^(steam_app_.*)$"
       "content game, class:^(.*\\.exe)$"
       "content game, class:^(steam_app_.*)$"
       "idleinhibit fullscreen, title:^(.*)$,class:^(.*)$"
     ];
   };

}
