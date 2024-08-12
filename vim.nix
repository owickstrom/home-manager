{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      (nvim-treesitter.withPlugins(p: [
        p.bash
        p.json
        p.lua
        p.markdown
        p.nix
        p.python
        p.rust
        p.zig
        p.vimdoc
      ]))
      conform-nvim
      neogit
      fzf-vim
    ];
    extraConfig = ''
      " For faster startup
      lua vim.loader.enable()

      " General
      set nocompatible            " get rid of Vi compatibility mode. SET FIRST!
      filetype plugin indent on   " filetype detection[ON] plugin[ON] indent[ON]
      syntax enable               " enable syntax highlighting (previously syntax on).

      " Tabs/spaces
      set tabstop=2
      set expandtab
      set shiftwidth=2

      " Navigation
      set scrolloff=3             " some lines around scroll for context

      " Cursor/Line
      set number
      set colorcolumn=-0          " based on textwidth
      set cursorline              " highlight the current line

      " Status/History
      set history=200             " remember a lot of stuff
      set ruler                   " Always show info along bottom.
      set cmdheight=1

      " Scrolling
      set ttyfast

      " Files
      set autoread                            " auto-reload files changed on disk
      set updatecount=0                       " disable swap files
      set wildmode=longest,list,full 

      " Vimdiff
      set diffopt=filler,vertical

      " Conceal (disabled by default)
      set conceallevel=0

      " Wrapping
      set nowrap

      " Leader
      nnoremap <Space> <Nop>
      let mapleader = ' '
      let maplocalleader = ' '

      " Make F1 work like Escape.
      map <F1> <Esc>
      imap <F1> <Esc>

      " Mouse issue (https://github.com/neovim/neovim/wiki/Following-HEAD#20170403)
      set mouse=a

      " Use system clipboard for yanks.
      set clipboard+=unnamedplus

      " Use ,t for 'jump to tag'.
      nnoremap <Leader>t <C-]>

      " Allow hidden windows
      set hidden

      " Grep with rg
      set grepprg=rg\ --line-number\ --column
      set grepformat=%f:%l:%c:%m

      " Theme
      set termguicolors
      set bg=dark
      colorscheme quiet
      highlight Keyword gui=bold
      highlight Comment gui=italic
      highlight Constant guifg=#999999
      highlight NormalFloat guibg=#333333

      luafile ${vim/keymap.lua}
      luafile ${vim/completion.lua}
      luafile ${vim/formatting.lua}
      luafile ${vim/git.lua}
      luafile ${vim/lsp.lua}
    '';
    extraPackages = with pkgs; [
        lua-language-server
    ];
  };

  xdg.configFile."zls.json".text = ''
    {
      "enable_build_on_save": true
    }
    '';
}
