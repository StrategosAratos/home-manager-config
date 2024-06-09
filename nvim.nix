{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      harpoon2
      mason-lspconfig-nvim 
      mason-nvim
      nvim-lspconfig
      nvim-treesitter-parsers.nix
      nvim-treesitter.withAllGrammars
      telescope-nvim
    ];
    extraConfig = builtins.readFile ./vim-extra-config.vim;
    extraLuaConfig = builtins.readFile ./vim-extra-config.lua;
    };
}
