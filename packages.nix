{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    kitty
    brave
    git
    ripgrep
    fd
    shellcheck
    pandoc
    nixfmt-rfc-style
    pulseaudio
    element-desktop-wayland
    trilium-desktop
    pcmanfm
    waybar
    wofi
    hyprpaper
    rustup
    nodejs_22
    thunderbird
    keepassxc
    helvum
    cava
    cli-visualizer
    vorta
    dex
    grimblast
    evince
    vlc
    discord
    typescript
    yarn
    godot_4
  ];
}
