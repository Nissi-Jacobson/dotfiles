{

  description = "Flake";

  inputs = {

    nixpkgs.url = "github:NixOs/nixpkgs/release-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    stylix.url = "github:danth/stylix";
  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem{
        inherit system;
        modules = [ 
          ./system/configuration.nix 
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
    homeConfigurations = {
      nissi = home-manager.lib.homeManagerConfiguration{
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./user/home.nix ];
      };
    };
  };

}
