{ inputs, ... }: {
  flake.homeModules.stylix = { pkgs, ... }: {
    imports = [ inputs.stylix.homeModules.stylix ];
    stylix = {
      enable = true;
      targets.firefox.profileNames = [ "default" ];
      targets.kde.useWallpaper.enable = false;
      targets.qt.enable = false;
      fonts = {
        sizes = {
          applications = 12;
          terminal = 12;
          desktop = 10;
          popups = 10;
        };
        sansSerif = {
          package = pkgs.inter;
          name = "Inter";
        };
        monospace = {
          package = pkgs.jetbrains-mono;
          name = "JetBrains Mono";
        };
        serif = {
          package = pkgs.noto-fonts;
          name = "Noto Sans";
        };
        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };
      base16Scheme = {
      scheme = "Ashen";
      author = "Daniel Fichtinger <daniel@ficd.ca>";
      variant = "dark";
      base00 = "121212"; # ---- dark
      base01 = "191919"; # ---
      base02 = "212121"; # --
      base03 = "535353"; # -
      base04 = "949494"; # +
      base05 = "d5d5d5"; # ++ old.a7a7a7
      base06 = "b4b4b4"; # +++
      base07 = "d5d5d5"; # ++++ light
      base08 = "B14242"; # red_ember
      base09 = "4A8B8B"; # blue
      base0A = "C4693D"; # orange_blaze
      base0B = "DF6464"; # red_glowing
      base0C = "E49A44"; # orange_smolder
      base0D = "D87C4A"; # orange_glow
      base0E = "B14242"; # red_ember
      base0F = "89492a"; # brown
      };
    };
  };
}
