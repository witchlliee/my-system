# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.niri.nixosModules.niri
      inputs.noctalia.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernelModules = ["ntsync"];
    kernelParams = [ 
    "quiet"
    "splash"
    ];
    kernel.sysctl = {
        "kernel.split_lock_mitigate" = 0;
        "vm.max_map_count" = 2147483642;
        "net.ipv4.tcp_fin_timeout" = 5;
        "kernel.sched_cfs_bandwidth_slice_us" = 3000;
     };
  };

  services.tuned.enable = true;

  networking.hostName = "my-nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  services.displayManager.gdm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ellie = {
    isNormalUser = true;
    description = "Ellie";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  fileSystems."/mnt/stuff" = 
    {
      device = "/dev/disk/by-uuid/4f00ab65-a229-4fab-994d-004a2f932582";
      fsType = "btrfs";
      options = [  
        "rw"
	"compress=zstd"
        "relatime"
	"ssd"
	"discard=async"
	"space_cache=v2"
	"subvol=/"
      ];
    };

  security.sudo-rs.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.autoUpgrade = {
    enable = true;
    flake = "github:witchlliee/my-system";
    flags = [
      "--print-build-logs"
      "--commit-lock-file"
    ];
    dates = "12:00";
  };

  zramSwap = { 
     enable = true;
     priority = 100;
     memoryPercent = 100;
  };

  hardware = {
    bluetooth = {
      enable = true;
      input =
      {
        General = {
          ClassicBondedOnly = true;
          IdleTimeout = 60;
        };
      };	
    };
  };

  xdg.terminal-exec.enable = true;

  services.blueman.enable = true;

 # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.git.enable = true;

  services.udisks2.enable = true;

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs = {
    niri = {
      enable = true;
      package = pkgs.niri-stable;
    };
  };

  security.soteria.enable = true;
  systemd.user.services.niri-flake-polkit.enable = false;

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        niri = {
          default = [ "gnome" "gtk"];
	   "org.freedesktop.impl.portal.Access" = ["gtk"];
           "org.freedesktop.impl.portal.Notification" = ["gtk"];
           "org.freedesktop.impl.portal.FileChooser" = ["gtk"]; 
	   "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
        };
      };
      extraPortals = [
       pkgs.xdg-desktop-portal-gtk
       pkgs.xdg-desktop-portal-gnome
      ];
    };
  };

  services.noctalia-shell.enable = true;

  services.gnome.gnome-keyring.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true; 
    localNetworkGameTransfers.openFirewall = true; 
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
  };

  services.udev.extraRules = ''
      # USB
      ATTRS{name}=="Sony Interactive Entertainment Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
      ATTRS{name}=="Sony Interactive Entertainment DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
      # Bluetooth
      ATTRS{name}=="Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
      ATTRS{name}=="DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    '';

  stylix = {
    enable = true;
    # image = ./wallpapers/wallhaven-qr2zj5_3840x2160.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/chalk.yaml";
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };

  programs.fish.enable = true;  

  # Install firefox.
  programs.firefox.enable = true;
  programs.chromium.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim 
    material-symbols
    bibata-cursors
    nwg-look
    inter-nerdfont
    nerd-fonts.roboto-mono
    cliphist
    matugen
    cava
    xwayland-satellite-unstable
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    gnome-secrets
    kdePackages.dolphin
    discord
    ghostty
    brave
    spotify

    inputs.quickshell.packages.${system}.default
    inputs.noctalia.packages.${system}.default
    
    heroic

    mangohud
    mangojuice
    btop
    winetricks

    wineWow64Packages.staging

    lsof
    wget
    arch-install-scripts
    fastfetch
    kdePackages.ark
    unrar
    app2unit
    cachix
    kdePackages.kservice
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
