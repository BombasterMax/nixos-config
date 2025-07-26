{
  pkgs,
  lib,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "toml"
      "lua"
      "basher"
    ];

    userSettings = {
      restore_on_startup = "none";
      autosave = "on_focus_change";
      vim_mode = false;
      theme = "Gruvbox Dark";
      ui_font_size = lib.mkForce 16;
      buffer_font_size = lib.mkForce 18;
      relative_line_numbers = true;

      assistant = {
        enabled = false;
      };

      auto_update = true;
      terminal = {
        copy_on_select = false;
        dock = "bottom";
        font_family = "FiraCode Nerd Font Mono";
        working_directory = "current_project_directory";
      };

      # File syntax highlighting
      file_types = {
        JSON = [

          "json"
          "jsonc"
          "*.code-snippets"
        ];
      };
      languages = {
        "Nix" = {
          "language_servers" = [
            "nixd"
            "!..."
          ];
        };

        Python = {
          "language_servers" = [ "pyright" ];
        };
      };

      lsp = {
        "pyright" = {
          binary = {
            path_lookup = true;
          };
        };
        "nixd" = {
          binary = {
            path_lookup = true;
          };
        };
        "gopls" = {
          binary = {
            path_lookup = true;
          };
        };

        "clangd" = {
          binary = {
            path_lookup = true;
          };
        };

        "rust-analyzer" = {
          binary = {
            path_lookup = true;
          };
        };
      };
    };
  };
}
