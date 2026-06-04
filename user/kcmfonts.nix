{ config, pkgs, ... }: {
  xdg.configFile."kcmfonts".text = ''
    [General]
    # 0 = None, 1 = Slight, 2 = Medium, 3 = Full
    HintStyle=1

    # 0 = None, 1 = RGB, 2 = BGR, 3 = VRGB, 4 = VBGR
    ForceSubPixelPosition=1
    Antialiasing=1
    LcdFilter=0
  '';
  xresources.properties = {
    "Xft.rgba" = "rgb";
    "Xft.hintstyle" = "hintslight";
    "Xft.hinting" = 1;
    "Xft.antialias" = 1;
  };
}
