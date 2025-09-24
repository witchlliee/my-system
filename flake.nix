{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, chaotic, home-manager, stylix, niri, ... }@inputs: {
    nixosConfigurations = {
      my-nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit self inputs; };
        modules = [
          ./configuration.nix
	  chaotic.nixosModules.default
          home-manager.nixosModules.home-manager
	  stylix.nixosModules.stylix
          {
            home-manager = {
	      useGlobalPkgs = true;
              useUserPackages = true;
              users.ellie = import ./my-system/home/home.nix;
              extraSpecialArgs = { inherit self inputs; };
	    };
          }
        ];
      };
    };
  };
}
