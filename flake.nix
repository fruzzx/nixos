{
  description = "nix nix swirl nix";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
   # nvibrant-old.url = "github:NixOS/nixpkgs/bd0ff2d3eac24699c3664d5966b9ef36f388e2ca";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake
  {inherit inputs;} (inputs.import-tree ./modules);
}
