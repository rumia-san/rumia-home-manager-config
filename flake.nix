{
  description = "home manager config using flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # Run the following command to build:
      # nix build .#homeConfigurations.rumia.activationPackage --extra-experimental-features 'nix-command flakes' && ./result/activate
      homeConfigurations.rumia = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
        ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
