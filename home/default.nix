{ config, pkgs, ... }:

{
  home.username = "bombaster";
  home.homeDirectory = "/home/bombaster";
  imports = [
    ./gnome
    ./nixvim
    ./cmd
    ./apps
  ];

  home.packages = import ./home-packages.nix { inherit pkgs; };
  # git config
  programs.git = {
    enable = true;
    userName = "Maxim Avramenko";
    userEmail = "BombasterMax@yandex.ru";
  };

  # Stating version
  home.stateVersion = "25.05";
}
