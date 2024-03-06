{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      raudio =
        "pactl load-module module-tunnel-sink server=tcp:192.168.0.1:4656";
      hm = "home-manager";
      nxsh = "nix-shell --run zsh";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    #oh-my-zsh = {
    #  enable = true;
    #  plugins = [ "git" "sudo" "rust" ];
    #  theme = "agnoster";
    #};
  };
}
