{ config, ... }:

{
 
   programs.niri.settings.window-rules = [
     {
       draw-border-with-background = false;
       geometry-corner-radius =
          let
            a = 5.0;
          in
        {
          top-left = a;
          top-right = a;
          bottom-left = a;
          bottom-right = a;
        };
       clip-to-geometry = true;
     }

     {
       matches = 
       [
         { app-id = "^.*\\.exe$"; }
	 { app-id = "^steam_app_.*$"; }
	 { app-id = "^steam_app_[0-9]+$"; }
	 { app-id = "^org.vinegarhq.Sober$"; }
	 { app-id = "bg3"; }
       ];
	   variable-refresh-rate = true;
     }

     {
       matches =
       [
         { app-id = "^firefox$"; 
	   title = ''^Picture-in-Picture$'';
	 }
	 { app-id = "^org.kde.dolphin$"; }
	 { app-id = "^com.vysp3r.ProtonPlus$"; }
       ];
           open-floating = true;
     }
     {
       matches =
       [
         { app-id = "^discord$"; }
	 { app-id = "^steam$"; }
	 { app-id = "^heroic$"; }
	 { app-id = "^firefox$"; }
       ];
           open-maximized = true;
     }

     {
       matches =
       [ 
         {
	   app-id = "^steam$";
	   title = ''^notificationtoasts_\d+_desktop$'';
	 }
       ];
           default-floating-position = {
             relative-to = "bottom";
               x = 10;
               y = 10;
           };	
     }
   ];

}
	 
