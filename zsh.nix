{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    initExtra = ''
       [[ ! -f "${./p10k.zsh}" ]] || source ${./p10k.zsh}
       [[ ! -f "~/.cargo/env" ]] || source ~/.cargo/env
    '';
    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];

    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
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
  };
}
