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
  flake.homeModules.mangohud = {
    programs.mangohud = {
      enable = true;
      settings = {
        fps = true;
        font_size = 24;
        background_alpha = "0.4";
        frametime = true;
        frame_timing = true;
        gpu_stats = true;
        gpu_temp = true;
        gpu_core_clock = true;
        gpu_mem_clock = true;
        gpu_power = true;
        cpu_stats = true;
        cpu_temp = true;
        cpu_mhz = true;
        cpu_power = true;
        vram = true;
        ram = true;
        position = "top-left";
        toggle_hud = "Shift_R+F12";
        toggle_hud_position = "Shift_R+F11";
        fps_limit_method = "early";
        fps_limit = "60";
      };
    };
  };
}
