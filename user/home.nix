{ config, pkgs, ... }: {

  imports = [
    ./services.nix
    ./apps.nix
  ];
  
  home.username = "fruzzx";
  home.homeDirectory = "/home/fruzzx";
  home.stateVersion = "26.05"; 
  
  home.packages = with pkgs; [
    libnotify
    discord
    btop-cuda
    mpv
    qbittorrent
    fastfetch
    upscaler
  ];
  programs.home-manager.enable = true;
}
