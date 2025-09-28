{ config, lib, pkgs, self, inputs, ... }:

{

  imports = [
    ./niri/default.nix
    ./hyprland/default.nix
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
  '';
  };

  home.packages = with pkgs; [
    hyprshot
    swappy
  ];

    home.stateVersion = "25.05";

}
