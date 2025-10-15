{ config, pkgs, ... }:

{
  imports = [
    ./hw/hardware-configuration.nix
    ./nix-ld.nix
  ];
  nixpkgs.config.allowUnfree = true;
  programs.command-not-found.enable = false;
  users.defaultUserShell = pkgs.fish;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "abbadon";
  nix.settings.trusted-users = [
    "root"
    "bombaster"
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  networking.networkmanager.enable = true;
  networking.extraHosts = '''';
  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };
  # X11 and GNOME.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.bombaster = {
    isNormalUser = true;
    description = "Maxim Avramenko";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      # system
      wl-clipboard
      # TODO: move something to home-packages.nix
      telegram-desktop
      wineWowPackages.stable
      git
      gcc
      openvpn
      dconf-editor
      nerd-fonts.fira-code
      # unfree shit
      obsidian
      volatility3
      steam-run
    ];
  };
  # Podman
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;

    };
  };
  environment.systemPackages = with pkgs; [
    dive
    podman-tui
    podman-compose
  ];


  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Logitech stuff
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  programs.fish.enable = true;
  # Install nekoray and openvpn
  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
    tunMode.setuid = true;
  };
  # State nixOS release
  system.stateVersion = "25.05";
}
