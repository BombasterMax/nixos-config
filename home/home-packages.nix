{ pkgs }:

with pkgs;
[
  # For installing flatpaks
  gnome-software

  # core packages for my workflow
  ptyxis
  zellij
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

  # weird stuff
  nerdfetch
  cowsay
  file
  which
  tree
  gnused
  gnutar
  gawk
  zstd
  gnupg

  # nix stuff
  nix-output-monitor

  # perfomance
  papers
  foliate
  glow
  gnome-solanum
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
  volatility3
  foremost
  autopsy
  imhex
  ## crypto
  hashcat
  hash-identifier
  johnny
  cyberchef
  # Development
  gh
  lazygit
  man-pages
  man-pages-posix
  devenv
  dive
  clang
  clang-tools
  valgrind
  cmake
  gnumake
  cargo
  rustc
  rustfmt
  rust-analyzer
  go
  gopls
  nixd
  nixfmt-rfc-style
  (python3.withPackages (
    ps: with ps; [
      ipython
    ]
  ))
  pyright
  podman-desktop
  # appsec
  shellcheck
  trivy
  clair
  grype
  # university
  typst
  tinymist
  # graphics
  krita
  gimp3
]
