{
  flake.homeModules.programs = {
    programs.fish = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake .#main";
        clean = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
        update = "nix flake update";
      };
      interactiveShellInit = ''
        set fish_greeting
      '';
    };
    programs.helix = {
      enable = true;
      defaultEditor = true;
     # settings = {
       # theme = "ashen";
     # };
     # themes = {
       # ashen_transparent = {
         # "inherits" = "ashen";
         # "ui.background" = {};
       # };
     # };
    };
    programs.kitty = {
      enable = true;
      extraConfig = ''
        include current-theme.conf
        shell fish
      '';
      settings = {
        confirm_os_window_close = 0;
       # background_opacity = "0.9";
      };
    };
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = false;
      };
    };
    programs.firefox = {
      enable = true;
      profiles.default = {
        isDefault = true;
        settings = {
          "toolkit.legacyUserProfilesCustomizations.stylesheets" = true;
        };
        userContent = ''
          @-moz-document url("about:newtab"), url("about:home") {
            body {
              background-color: #121212 !important;
            }
          }
        '';
      };
    };
  };
}
