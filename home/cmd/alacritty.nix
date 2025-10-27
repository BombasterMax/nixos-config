{ ... }:
{
  home.file.".config/alacritty/gruvbox_dark.toml".text = ''


    # Colors (Gruvbox dark)

    # Default colors
    [colors.primary]
    # hard contrast background = = '#1d2021'
    background = '#282828'
    # soft contrast background = = '#32302f'
    foreground = '#ebdbb2'

    # Normal colors
    [colors.normal]
    black   = '#282828'
    red     = '#cc241d'
    green   = '#98971a'
    yellow  = '#d79921'
    blue    = '#458588'
    magenta = '#b16286'
    cyan    = '#689d6a'
    white   = '#a89984'

    # Bright colors
    [colors.bright]
    black   = '#928374'
    red     = '#fb4934'
    green   = '#b8bb26'
    yellow  = '#fabd2f'
    blue    = '#83a598'
    magenta = '#d3869b'
    cyan    = '#8ec07c'
    white   = '#ebdbb2'
  '';
  programs.alacritty = {
    enable = true;
    settings = {
      general.import = [ "~/.config/alacritty/gruvbox_dark.toml" ];
      terminal.shell.program = "/bin/sh";
      terminal.shell.args = [
        "-lc"
        "zellij attach -c main"
      ];
      font.size = 14.0;
      font.normal.family = "FiraCode Nerd Font";
      window.startup_mode = "Maximized";
      window.decorations = "None";
    };
  };

  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox-dark";
      scrollback_editor = "nvim";
    };
  };
}
