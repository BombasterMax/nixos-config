{
  pkgs,
  pkgsUnstable,
  lib,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    package = pkgsUnstable.zed-editor;
    extensions = [
      "toml"
      "lua"
      "basher"
      "typst"
      "comment"
    ];

    userSettings = {
      disable_ai = true;
      "telemetry" = {
        "diagnostics" = false;
        "metrics" = false;
      };

      restore_on_startup = "none";
      autosave = "on_focus_change";
      vim_mode = false;
      theme = "Gruvbox Dark";
      ui_font_size = lib.mkForce 18;
      buffer_font_size = lib.mkForce 20;
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

      # My custom bindings
      userKeymaps = [
        {
          bindings = {
            "cmd-k cmd-left" = [
              "workspace::ActivatePaneInDirection"
              "Left"
            ];
            "cmd-k cmd-right" = [
              "workspace::ActivatePaneInDirection"
              "Right"
            ];
            "cmd-k cmd-up" = [
              "workspace::ActivatePaneInDirection"
              "Up"
            ];
            "cmd-k cmd-down" = [
              "workspace::ActivatePaneInDirection"
              "Down"
            ];
            "cmd-k shift-left" = [
              "workspace::SwapPaneInDirection"
              "Left"
            ];
            "cmd-k shift-right" = [
              "workspace::SwapPaneInDirection"
              "Right"
            ];
            "cmd-k shift-up" = [
              "workspace::SwapPaneInDirection"
              "Up"
            ];
            "cmd-k shift-down" = [
              "workspace::SwapPaneInDirection"
              "Down"
            ];

          };
        }
      ];

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
        Typst = {
          "language_servers" = [ "tinymist" ];
        };

        Python = {
          "language_servers" = [ "pyright" ];
        };
      };

      lsp = {
        "tinymist" = {
          "settings" = {
            "exportPdf" = "onSave";
            "outputPath" = "$root/$name";
          };
        };

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
