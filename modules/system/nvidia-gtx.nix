{
  flake.nixosModules.nvidia-gtx = { config, pkgs, ... }: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
    services.xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      excludePackages = [ pkgs.xterm ];
    };
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };
  };
}
