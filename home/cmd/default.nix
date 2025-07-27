{ config, pkgs, ... }:

{
  imports = [
    ./starship.nix
    ./fish.nix
    ./rice.nix
    ./yazi.nix
  ];
}
