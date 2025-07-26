{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings
      starship init fish | source
      alias ls="eza"
      alias lt="eza --tree"
      set -Ux MANPAGER 'nvim +Man!'
      set -gx EDITOR "nvim"
    '';

    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];
  };
}
