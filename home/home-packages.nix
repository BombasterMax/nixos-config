{ pkgs }:

with pkgs;
[
  # For installing flatpaks
  gnome-software

  # programms i use to operate my PC
  alacritty
  ptyxis
  ghostty
  yazi
  zoxide
  ripgrep
  jq
  yq-go
  eza
  fzf
  far2l
  fd
  bat
  neovim
  libqalculate
  qalculate-gtk
  file
  which
  tree
  gnused
  gnutar
  gawk
  zstd
  gnupg

  # applications for daily use
  papers
  foliate
  gnome-solanum

  # university
  libreoffice
  typst
  tinymist

  # graphics
  krita
  gimp3

  # archives stuff
  zip
  xz
  unzip
  p7zip

  # network monitoring
  mtr
  iperf3
  dnsutils
  ldns
  aria2
  socat
  ipcalc

  # ricing
  # fastfetch imported in rice.nix
  nerdfetch
  cowsay
  nitch
  cpufetch
  onefetch

  # nix stuff
  nix-output-monitor

  # perfomance
  htop
  btop
  iotop
  iftop

  # tracing
  strace
  ltrace
  lsof

  # system monitoring
  sysstat
  lm_sensors
  ethtool
  pciutils
  usbutils

  #  browser stuff
  addwater

  # Cybersecurity
  ## infra
  netexec
  nmap
  zenmap

  ## web
  zap
  ffuf
  dirbuster
  sqlmap

  ## networking
  wireshark
  netcat
  tcpdump

  ## rev
  xxd
  (rizin.withPlugins (
    ps: with ps; [
      rz-ghidra
      sigdb
    ]
  ))
  radare2
  ghidra
  cutter
  edb

  ## forensics
  binwalk
  exiftool
  foremost
  autopsy
  imhex

  ## crypto
  hashcat
  hash-identifier
  johnny
  cyberchef

  # Development
  ## vcs stuff
  gh
  lazygit

  ## man pages in case i am stupid
  man-pages
  man-pages-posix
  ## devenv becaues it's cool
  devenv

  ## container stuff
  dive
  podman-desktop

  ## C
  clang
  clang-tools
  valgrind
  cmake
  gnumake

  ## Rust
  cargo
  rustc
  rustfmt
  rust-analyzer

  ## Golang
  go
  gopls

  ## Nix
  nixd
  nixfmt-rfc-style

  ## Python
  (python3.withPackages (
    ps: with ps; [
      ipython
    ]
  ))
  pyright

  # appsec
  shellcheck
  trivy
  clair
  grype
  ## data analysis
  nushell
]
