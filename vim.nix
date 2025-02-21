{
  config,
  lib,
  pkgs,
  ...
}:

let
  auto-dark-mode =
    let
      version = "02ef9553e2a1d6e861bc6955d58ce5883d28a6ad";
    in
    pkgs.vimUtils.buildVimPlugin {
      inherit version;
      pname = "auto-dark-mode-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "f-person";
        repo = "auto-dark-mode.nvim";
        rev = version;
        hash = "sha256-FTXakglUrqifEXjzES6M4L+rthItu5rlw6QyIOLYNOc=";
      };
    };
in
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      auto-dark-mode
      # lsp/langs
      nvim-lspconfig
      (nvim-treesitter.withPlugins (p: [
        p.bash
        p.go
        p.java
        p.json
        p.lua
        p.markdown
        p.nix
        p.python
        p.rust
        p.zig
        p.vimdoc
        p.graphql
      ]))
      nvim-jdtls
      # git
      neogit
      gitlinker-nvim
      # other
      conform-nvim
      fzf-lua
      zenbones-nvim
      goyo
      copilot-lua
      CopilotChat-nvim
    ];
    extraConfig = ''
      " For faster startup
      lua vim.loader.enable()

      " General
      set nocompatible            " get rid of Vi compatibility mode. SET FIRST!
      filetype plugin indent on   " filetype detection[ON] plugin[ON] indent[ON]
      syntax enable               " enable syntax highlighting (previously syntax on).
      set exrc                    " load .vimrc files from cwd
      set secure                  " and do so in a secure way

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
      let g:bones_compat = 1
      colorscheme zenbones

      function! MyHighlights() abort
        " highlight Normal         guibg=none
        highlight Comment        gui=italic
      endfunction

      augroup MyColors
        autocmd!
        autocmd ColorScheme * call MyHighlights()
      augroup END

      call MyHighlights()

      autocmd BufEnter * TSEnable highlight indent
      autocmd BufEnter * TSBufEnable highlight indent

      luafile ${vim/theming.lua}
      luafile ${vim/keymap.lua}
      luafile ${vim/completion.lua}
      luafile ${vim/formatting.lua}
      luafile ${vim/git.lua}
      luafile ${vim/lsp.lua}
    '';
    extraPackages = with pkgs; [
      lua-language-server
      jdt-language-server
    ];
  };

  xdg.configFile."zls.json".text = ''
    {
      "enable_build_on_save": true
    }
  '';
}
