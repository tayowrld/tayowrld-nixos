{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixos-apple-silicon.nixosModules.default
    ./hardware-configuration.nix
  ];
  

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = false;
  };

  hardware.asahi = {
    peripheralFirmwareDirectory = "/boot/asahi";
    setupAsahiSound = true;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  nix.settings = {
    experimental-features = [
      "flakes"
      "nix-command"
    ];
  };

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    sing-box.enable = true;
    sing-box.settings = {
      inbounds = [
        {
          type = "socks";
	  tag = "socks-in";
	  listen = "127.0.0.1";
	  listen_port = 1080;
	}
      ];

      outbounds = [
        {
	  type = "shadowsocks";
	  tag = "ss-out";

	  server = "82.40.37.119";
	  server_port = 36435;

          method = "chacha20-ietf-poly1305";
	  password = "3q434tSltqaWoVfZ8u5as3";
	}
      ];

      route = {
        rules = [
          { inbound = "socks-in"; outbound = "ss-out"; }
	];
      };
    };
  };

  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
    hostName = "lesi";
  };

  environment.systemPackages = with pkgs; [
    asahi-bless
    git vim # so based
    
    # based
    ghostty neovim
    chromium firefox
    
    # coding
    nodejs docker docker-compose vscode
    
    # lifestyle
    siyuan 
    telegram-desktop discord

    # system
    libnotify
  ];

  users.mutableUsers = true;

  users.users.ivankurbakov = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "input" "docker" ];
  };

  system.stateVersion = "25.05";
}
