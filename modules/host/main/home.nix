{ self, inputs, ... }: {
  # Extension of configuration
  flake.nixosModules.main = { pkgs, ... }: {
    imports = [ inputs.home-manager.nixosModules.default ];
    users.users.fruzzx = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [ tree ];
     # shell = pkgs.fish;
    };
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
    # Import homeModules
    home-manager.users.fruzzx = {
      imports = with self.homeModules; [
        mainHome
        droidcam-fix
        nvibrant
        programs
        stylix
        mangohud
      ];
    };
  };
  # Home
  flake.homeModules.mainHome = { pkgs, lib, ... }: {
    programs.home-manager.enable = true;
    home.activation = {
      clearGtkBridges = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
        rm -f /home/fruzzx/.gtkrc-2.0.backup
      '';
    };
    home.username = "fruzzx";
    home.homeDirectory = "/home/fruzzx";
    home.stateVersion = "26.05";
    home.packages = with pkgs; [
      git
      discord
      btop-cuda
      mpv
      qbittorrent
      fastfetch
      upscaler
      heroic
    ];
  };
}
