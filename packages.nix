{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    cava
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
    nixd
    nixfmt-rfc-style
    pcmanfm
    pulseaudio
    ripgrep
    rustup
    steam
    sumneko-lua-language-server
    thunderbird
    trilium-desktop
    typescript
    unzip
    vlc
    vorta
    waybar
    wl-clipboard-rs
    wofi
    yarn
    zsh
  ];
}
