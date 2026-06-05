{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./headphone-fix.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.desktopManager.plasma6.enable = true;
  services.displayManager = {
    plasma-login-manager.enable = true;
    autoLogin.user = "fruzzx";    
  };

  hardware.graphics = {
    enable = true;
  }; 

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };

  services.tuned.enable = true;
  services.tuned.ppdSupport = true;

  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 100;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];
 
 # boot.kernelParams = [ "nowatchdog" ];
 # systemd.extraConfig = "DefaultTimeoutStopSec=10s";

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Belgrade";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [ "fruzzx" ];
        commands = [
          {
            command = "/run/current-system/sw/bin/nixos-rebuild";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/nix-collect-garbage";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };

  users.users.fruzzx = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];     packages = with pkgs; [
      tree
    ];
  };


  services.flatpak.enable = true;

  programs.droidcam.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    wget
  ];

  services.xserver.excludePackages = [ pkgs.xterm ];
  
  system.stateVersion = "26.05"; 
}

