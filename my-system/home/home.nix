{ config, lib, pkgs, self, inputs, ... }:

{

  imports = [
    ./niri/default.nix
  ];

    home = {
      username = "ellie";
      homeDirectory = "/home/ellie";
    };

  programs.git = {
    enable = true;
    userName = "witchlliee";
    userEmail = "witchlliee@kk.io";
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/home/ellie/my-nix";
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      nix-update = "nix flake update --flake ~/my-nix && sudo nixos-rebuild switch --flake ~/my-nix";
      nix-switch = "sudo nixos-rebuild switch --flake ~/my-nix";
    };
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      fish_add_path -m ~/.nix-profile/bin
  '';
  };

    home = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland,x11,windows";
      GDK_BACKEND = "wayland";
      PROTON_USE_WAYLAND = "1";
    };

    packages = with pkgs; [
      linux-wallpaperengine
      hyprshot
      swappy
      cosmic-files
      cosmic-store
    ];
  };

    home.stateVersion = "25.05";

}
