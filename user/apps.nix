{ config, pkgs, ... }: {
  
  programs.fish = {
    enable = true;
    shellAliases = {
      ncg = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
      nrs = "sudo nixos-rebuild switch --flake /home/fruzzx/.nixos";
    };
    interactiveShellInit = ''
        set fish_greeting
      '';
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "ashen";
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      include current-theme.conf
      shell fish
    '';
    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.9";
    };
  };

  programs.git = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
    };
  };
}
