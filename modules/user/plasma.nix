{
  flake.nixosModules.plasma = {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager = {
        plasma-login-manager.enable = true;
        autoLogin.user = "fruzzx";
      };
    };
  };
}
