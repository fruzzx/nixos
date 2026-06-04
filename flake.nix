{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nvibrant = {
      url = "github:mikaeladev/nix-nvibrant/ef41a074ef3f4229bd9d0521e73e4b404d1e1884";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nvibrant, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";       
      modules = [
        ./system/configuration.nix 
        ({ ... }: {
          nixpkgs.overlays = [ nvibrant.overlays.default ];
        })
          home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
      	  home-manager.backupFileExtension = "backup";
          home-manager.users.Fruzz = {
            imports = [ ./user/home.nix ];
          };
        }
      ];
    };
  };
}
