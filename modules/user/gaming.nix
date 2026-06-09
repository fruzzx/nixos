{
  flake.nixosModules.gaming = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
      package = pkgs.steam.override {
        extraPkgs = pkgs': with pkgs'; [ kdePackages.breeze ];
      };
    };
    programs.gamemode = {
      enable = true;
      enableRenice = true;
      settings = {
        general = {
          softrealtime = "auto";
          renice = 10;
        };
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send -a 'GameMode' 'Enabled'";
          end = "${pkgs.libnotify}/bin/notify-send -a 'GameMode' 'Disabled'";
        };
      };
    };
  };
}
