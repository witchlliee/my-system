{ config, lib, pkgs, self, inputs, ... }:

{

  imports = [
   # ./niri/default.nix
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
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
  '';
  };

  home.packages = with pkgs; [

  ];

    home.stateVersion = "25.05";

}
