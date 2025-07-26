# starship.nix
{ ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      format = "$username$directory[](fg:color_yellow bg:color_yellow)$git_branch$git_status(fg:color_yellow)$python[](fg:color_yellow)$line_break$character";
      palette = "terminal";

      # ── modules ────────────────────────────────────────────────────────
      c = {
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
        style = "bg:color_blue";
        symbol = "c";
      };

      python = {
        style = "fg:color_fg0 bg:color_yellow";
        python_binary = [
          "python3"
          "python"
        ];
        format = "[(\${virtualenv})]($style)";
      };

      character = {
        disabled = false;
        error_symbol = "[](bold fg:color_red)";
        success_symbol = "[](bold fg:color_green)";
        vimcmd_replace_one_symbol = "[](bold fg:color_purple)";
        vimcmd_replace_symbol = "[](bold fg:color_purple)";
        vimcmd_symbol = "[](bold fg:color_green)";
        vimcmd_visual_symbol = "[](bold fg:color_yellow)";
      };

      cmd_duration = {
        disabled = false;
        format = "[[ 🕓 $duration ](fg:color_fg0 bg:color_bg1)]($style)";
        style = "bg:color_bg1";
      };

      directory = {
        format = "[ $path ]($style)";
        style = "fg:color_fg0 bg:color_yellow";
        truncation_length = 2;
        truncation_symbol = "…/";
      };

      git_branch = {
        format = "[[ $symbol $branch ](fg:color_fg0 bg:color_yellow)]($style)";
        style = "bg:color_aqua";
        symbol = "";
      };

      git_status = {
        format = "[[($all_status$ahead_behind) ](fg:color_fg0 bg:color_yellow)]($style)";
        style = "bg:color_aqua";
      };

      golang = {
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
        style = "bg:color_blue";
        symbol = "go";
      };

      haskell = {
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
        style = "bg:color_blue";
        symbol = "hs";
      };

      line_break = {
        disabled = false;
      };

      nix_shell = {
        format = "[[ $symbol( $name) ](fg:color_blue bg:color_bg3)]($style)";
        heuristic = true;
        style = "bg:color_bg3";
        symbol = "nix";
      };

      rust = {
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
        style = "bg:color_blue";
        symbol = "rs";
      };

      username = {
        format = "[ $user ]($style)";
        show_always = false;
        style_root = "bg:color_orange fg:color_fg0";
        style_user = "bg:color_orange fg:color_fg0";
      };

      # ── palettes ───────────────────────────────────────────────────────
      palettes = {
        gruvbox_dark = {
          color_aqua = "#689d6a";
          color_bg1 = "#3c3836";
          color_bg3 = "#665c54";
          color_blue = "#458588";
          color_fg0 = "#fbf1c7";
          color_green = "#98971a";
          color_orange = "#d65d0e";
          color_purple = "#b16286";
          color_red = "#cc241d";
          color_yellow = "#d79921";
        };

        terminal = {
          color_aqua = "cyan";
          color_bg1 = "white";
          color_bg3 = "black";
          color_blue = "blue";
          color_fg0 = "black";
          color_green = "green";
          color_orange = "yellow";
          color_purple = "purple";
          color_red = "red";
          color_yellow = "bright-yellow";
        };
      };
    };
  };
}
