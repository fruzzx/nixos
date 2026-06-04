{ config, pkgs, ... }: {

  imports = [
    ./services.nix
    ./apps.nix
  ];
  
  home.username = "Fruzz";
  home.homeDirectory = "/home/Fruzz";
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
