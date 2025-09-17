{ ... }:
{
  home.file.".config/yazi/keymap.toml".text = ''
      [[mgr.prepend_keymap]]
    on   = "!"
    for  = "unix"
    run  = 'shell "$SHELL" --block'
    desc = "Open $SHELL here"

    # If you also using Yazi on Windows:
    [[mgr.prepend_keymap]]
    on   = "!"
    for  = "windows"
    run  = 'shell "powershell.exe" --block'
    desc = "Open PowerShell here"
  '';
  # don't forget to install theme ya pack -a bennyyip/gruvbox-dark
  home.file.".config/yazi/theme.toml".text = ''
    [flavor]
    dark = "gruvbox-dark"
  '';
}
