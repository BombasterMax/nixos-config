{ config, pkgs, ... }:

{
  imports = [

    ./starship.nix
    ./fish.nix
    ./rice.nix
    ./yazi.nix
    ./alacritty.nix
    ./ghostty.nix
  ];
}
