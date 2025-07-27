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
      function y
      	set tmp (mktemp -t "yazi-cwd.XXXXXX")
      	yazi $argv --cwd-file="$tmp"
      	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
      		builtin cd -- "$cwd"
      	end
      	rm -f -- "$tmp"
      end
    '';

    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];
  };
}
