{ pkgs, ... }: {

  systemd.user.services.nvidia-vibrance = {
    Unit = {
      Description = "set nvidia digital vibrance with nvibrant";
      PartOf = [ "graphical-session.target" ];
    };
    
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.nvibrant}/bin/nvibrant 0 0 1024";
      RemainAfterExit = true;
    };
  };




  systemd.user.services.droidfix = {
    Unit = {
      Description = "Load DroidCam ALSA Loopback Source";
      PartOf = [ "graphical-session.target"];
      After = [ "pipewire.service" ];
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.pulseaudio}/bin/pactl \
          load-module \
          module-alsa-source \
          source_properties=device.description=DroidCam \
          channels=1 \
          rate=16000 \
          format=s16le \
          device=hw:Loopback,1,0
      '';
      RemainAfterExit = true;
    };
  };
}
