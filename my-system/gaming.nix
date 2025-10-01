{ config, pkgs, ... }:

{

  programs.steam = {
    enable = true;
    protontricks.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  services.udev.extraRules = ''
      # USB
    ATTRS{name}=="Sony Interactive Entertainment Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    ATTRS{name}=="Sony Interactive Entertainment DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
      # Bluetooth
    ATTRS{name}=="Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    ATTRS{name}=="DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';

  environment = {
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
    systemPackages = with pkgs; [
        # launchers & emulators & games
      heroic 
      lutris
      pokemmo-installer
      prismlauncher
      dolphin-emu
      pcsx2
      rpcs3
      shadps4
      
        # wine/proton
      wineWow64Packages.staging
      winetricks
      protonplus

        # tools
      vulkan-tools
      mangohud
      mangojuice
      evtest
      evtest-qt

        # libs
      glfw
    ];
  };

}
