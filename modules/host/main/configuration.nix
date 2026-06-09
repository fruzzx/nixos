{ self, inputs, ... }: {
  # Import nixosModules
  flake.nixosConfigurations.main = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      main
      nvidia-gtx
      pipewire
      tuned
      zram
      headphone-fix
      sudo
      plasma
      droidcam
      gaming
    ];
  };
  # Main system configuration
  flake.nixosModules.main = { pkgs, ... }: {
    services.flatpak.enable = true;
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.tmp.cleanOnBoot = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.supportedFilesystems = [ "ntfs" ];
    boot.kernelParams = [ "nowatchdog" ];
    systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
    systemd.settings.Manager.DefaultTimeoutStartSec = "10s";
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;
    time.timeZone = "Europe/Belgrade";
    i18n.defaultLocale = "en_US.UTF-8";
    system.stateVersion = "26.05";
    environment.systemPackages = with pkgs; [
      vim
    ];  
  };
}
