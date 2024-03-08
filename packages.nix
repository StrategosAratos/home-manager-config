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
    texlive.combined.scheme-full
    nixfmt
    pulseaudio
    element-desktop-wayland
    obsidian
    pcmanfm
    waybar
    wofi
    jetbrains-toolbox
    hyprpaper
    moonlight-qt
    rustup
    starship
    clang_17
  ];
}
