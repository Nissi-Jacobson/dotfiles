{

  description = "Flake";

  inputs = {

    # nix pkgs
    nixpkgs.url = "github:NixOs/nixpkgs/master";

    # home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nix colors
    nix-colors.url = "github:misterio77/nix-colors";

    # stylix
    stylix.url = "github:danth/stylix/master";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    # Zen Browser
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    # Sunsetr
    sunsetr.url = "github:psi4j/sunsetr";
    sunsetr.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = {self, nixpkgs, home-manager, stylix, ...}@inputs: 
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
        modules = [ 
          ./user/home.nix 
          inputs.stylix.homeModules.stylix
        ];
      };
    };
  };

}
