{ config, ... }:

{

   programs.niri.settings = {
     outputs = {
       "DP-1" = {
          mode = {
	    width = 1920;
	    height = 1080;
	    refresh = 239.964;
	  variable-refresh-rate = "on-demand";
	  scale = 1.0;
	  position = { x = 0; y = 0; };
	  };
       };
     };

     prefer-no-csd = true;

     input = {
       keyboard.xkb.layout = "br";
       focus-follows-mouse.enable = true;
     };

     cursor = {
       size = 24;
       theme = "Bibata-Modern-Ice";
     };

     layout = {
       background-color = "#00000000";
       border = {
         enable = true;
	 width = 4;
	 active = "#cba6f7";
	 inactive = "#505050";
       };
       gaps = 16;

       struts = {
          left = 16;
          right = 16;
          top = 16;
          bottom = 16;
       };
     };

     environment = {
       QT_QPA_PLATFORM = "wayland";
       SDL_VIDEODRIVER = "wayland,x11,windows";
       GDK_BACKEND = "wayland";
       PROTON_ENABLE_WAYLAND = "1";
       PROTON_USE_WOW64 = "1";
     };
   };

}



