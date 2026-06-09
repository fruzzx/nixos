{
  flake.nixosModules.sudo = {
    security.sudo = {
      enable = true;
      extraRules = [
        {
          users = [ "fruzzx" ];
          commands = [
            {
              command = "/run/current-system/sw/bin/nixos-rebuild";
              options = [ "NOPASSWD" ];
            }
            {
              command = "/run/current-system/sw/bin/nix-collect-garbage";
              options = [ "NOPASSWD" ];
            }
          ];
        }
      ];
    };
  };
}
