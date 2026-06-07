{ config, pkgs, lib, ... }: {

  imports = [
    ./services.nix
    ./apps.nix
    ./stylix.nix
    ./kcmfonts.nix
  ];
  
  home.username = "fruzzx";
  home.homeDirectory = "/home/fruzzx";
  home.stateVersion = "26.05"; 
  home.activation = {
    clearGtkBridges = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      rm -f /home/fruzzx/.gtkrc-2.0
      rm -f /home/fruzzx/.gtkrc-2.0.backup
    '';
  };
  
  home.packages = with pkgs; [
    libnotify
    discord
    btop-cuda
    mpv
    qbittorrent
    fastfetch
    upscaler
    quickemu
    quickgui
    mangohud
    goverlay
  ];
  programs.home-manager.enable = true;
}
