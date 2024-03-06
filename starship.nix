{ config, lib, pkgs, ... }:

let
  utils = import ./starship-utils.nix; in {
  programs.starship = {
    enable = true;
    settings = with utils;
      let
        widgets = {
          login = {
            content = "$username@$hostname";
            bg = "1";
            fg = "0";
          };
          pwd = {
            content = "$directory";
            bg = "2";
            fg = "0";
          };
        };
      in {
        add_newline = false;
        format = makeFormatString [
            widgets.login
            widgets.pwd
          ];

        username = {
          show_always = true;
          format = "[$user](${color.show widgets.login})";
        };
        hostname = {
          ssh_only = false;
          format = "[$hostname]($style)";
          style = "${color.show widgets.login}";
        };
        directory = {
          format = "[ $path ]($style)";
          style = "${color.show widgets.pwd}";
        };
      };
  };
}
