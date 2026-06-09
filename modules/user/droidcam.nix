{
  flake.nixosModules.droidcam = {
    programs.droidcam.enable = true;
  };
  flake.homeModules.droidcam-fix = { pkgs, ... }: {
    systemd.user.services.droidcam-fix = {
      Unit = {
        Description = "Load DroidCam ALSA Loopback Source";
        PartOf = [ "graphical-session.target" ];
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
  };
}
