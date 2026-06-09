{
  flake.homeModules.nvibrant = { pkgs, ... }:
    let
      nvibrantPinned = with pkgs; stdenv.mkDerivation (finalAttrs: {
        pname = "nvibrant";
        version = "1.1.0";
        src = pkgs.fetchFromGitHub {
          owner = "Tremeschin";
          repo = "nvibrant";
          rev = "v${finalAttrs.version}";
          hash = "sha256-RZIi1V3hcwZdaI84Nd0YSQOjDng9/ZDg7aqfTL7GJIU=";
          fetchSubmodules = true;
        };
        nativeBuildInputs = [
          meson
          ninja
          pkg-config
        ];
        mesonBuildType = "release";
        meta = with lib; {
          description = "Configure NVIDIA's Digital Vibrance on Wayland";
          homepage = "https://github.com/Tremeschin/nvibrant";
          license = licenses.gpl3Only;
          maintainers = [ maintainers.mikaeladev ];
          platforms = [ "x86_64-linux"];
          mainProgram = "nvibrant";
        };
      });
    in
    {
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
          ExecStart = "${nvibrantPinned}/bin/nvibrant 0 0 1024";
          RemainAfterExit = true;
        };
      };
    };
}
