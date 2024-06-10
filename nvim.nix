{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      harpoon2
      telescope-nvim
      mason-nvim
      mason-lspconfig-nvim      
      nvim-treesitter-parsers.nix
    ];
 # extraConfig = builtins.readFile ./vim-extra-config.vim;
 # extraLuaConfig = builtins.readFile ./vim-extra-config.lua;
  };
}
