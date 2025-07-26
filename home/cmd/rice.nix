# fastfetch.nix
{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "nixos_old_small";
        padding = {
          top = 1;
          left = 2;
        };
      };

      display = {
        separator = "";
        key.width = 10;
      };

      modules = [
        "title"
        "break"
        {
          type = "os";
          key = "os";
          format = "{3}";
        }
        {
          type = "host";
          key = "host";
        }
        {
          type = "kernel";
          key = "kernel";
        }
        {
          type = "uptime";
          key = "uptime";
        }
        {
          type = "packages";
          key = "pkgs";
        }
        {
          type = "shell";
          key = "shell";
        }
        {
          type = "display";
          key = "video";
        }
        {
          type = "de";
          key = "de";
        }
        {
          type = "wm";
          key = "wm";
          format = "{1}";
        }
        {
          type = "terminal";
          key = "term";
        }
        "break"
        {
          type = "cpu";
          key = "cpu";
          format = "{1}";
        }
        {
          type = "gpu";
          key = "gpu";
          format = "{2}";
        }
        {
          type = "memory";
          key = "memory";
          format = "{1} / {2}";
        }
        {
          type = "disk";
          key = "disk";
          format = "{1} / {2} ({9})";
        }
        {
          type = "battery";
          key = "bat";
        }
        {
          type = "poweradapter";
          key = "pwr";
        }
      ];
    };
  };
}
