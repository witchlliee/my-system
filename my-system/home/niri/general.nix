{ config, lib, pkgs, ... }:

{

   programs.niri.settings = {
     outputs = {
       "DP-1" = {
          mode = {
	    width = 1920;
	    height = 1080;
	    refresh = 239.964;
	  };
	  variable-refresh-rate = "on-demand";
	  scale = 1.0;
	  position = { x = 0; y = 0; };
	  };
     };

     prefer-no-csd = true;

     hotkey-overlay = {
       skip-at-startup = true;
     };

     xwayland-satellite.path = "${lib.getExe pkgs.xwayland-satellite-unstable}";

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
	 active = {
	   color = "#cba6f7";
	 };  
	 inactive = {
	   color = "#505050";
	 };  
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
       NIXOS_OZONE_WL = "1";
       QT_QPA_PLATFORM = "wayland";
       SDL_VIDEODRIVER = "wayland,x11,windows";
       GDK_BACKEND = "wayland";
       PROTON_ENABLE_WAYLAND = "1";
       PROTON_USE_WOW64 = "1";
     };
   };

}



