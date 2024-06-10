{pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    theme = "Catppuccin-Frappe";
    settings = {
    enable_audio_bell = false;
    };
    font = { name = "FiraCode"; };
    shellIntegration = {
      enableZshIntegration = true;
    };
  };
}
