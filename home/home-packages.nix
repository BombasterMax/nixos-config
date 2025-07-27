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
  # infra
  nmap
  zenmap
  # web
  zap
  ffuf
  dirbuster
  # rev
  radare2
  binwalk
  ghidra
  cutter
  edb
  # Development
  gh
  devenv
  dive
  podman-tui
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
]
