{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixvim,
      nur,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgsUnstable = import nixpkgs-unstable { inherit system; };
    in
    {
      nixosConfigurations = {
        abbadon = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./configuration.nix

            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            (
              { ... }:
              {
                home-manager = {
                  useUserPackages = true;

                  sharedModules = [
                    nixvim.homeManagerModules.nixvim
                    nur.modules.homeManager.default
                  ];
                  extraSpecialArgs = {
                    inherit inputs pkgsUnstable;
                  };

                  users.bombaster = import ./home;
                };
              }
            )
          ];
        };
      };
    };
}
