{
  flake.nixosModules.tuned = {
    services.tuned = {
      enable = true;
      ppdSupport = true;
    };
  };
}
