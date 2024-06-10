{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    cava
    nixd
    cli-visualizer
    dex
    discord
    element-desktop-wayland
    evince
    fd
    git
    grimblast
    helvum
    hyprpaper
    keepassxc
    kitty
    nixfmt-rfc-style
    pcmanfm
    pulseaudio
    ripgrep
    rustup
    shellcheck
    thunderbird
    trilium-desktop
    typescript
    vlc
    vorta
    waybar
    wofi
    yarn
    zsh
  ];
}
