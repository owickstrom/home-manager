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
      nvim-treesitter.withAllGrammars
      lush-nvim
      zenbones-nvim
      conform-nvim
      neogit

      # Completions
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-nvim-lsp-signature-help

    ];
    extraConfig = ''
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
      set colorcolumn=80          " ruler at 80 chars width
      set cursorline              " highlight the current line

      " Status/History
      set history=200             " remember a lot of stuff
      set ruler                   " Always show info along bottom.
      set cmdheight=1

      " Scrolling
      set ttyfast

      " Files
      set autoread                   " auto-reload files changed on disk
      set updatecount=0              " disable swap files
      set wildmode=longest,list,full " :e completion mode

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

      " Theme
      set termguicolors
      set bg=light
      colorscheme zenwritten

      lua << EOF
        require("conform").setup({
          formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            nix = { "nixfmt" },
            ocaml = { "ocamlformat" },
            zig = { "zigfmt" },
            javascript = { "prettier" },
            typescript = { "prettier" },
          },
        })
      EOF

      " Neogit
      lua << EOF
        local neogit = require('neogit')
        neogit.setup {}
      EOF
      map <Leader>g :Neogit<CR>

      " LSP
      lua << EOF
        local lsp = require('lspconfig')
        lsp.zls.setup{}
        lsp.zls.setup{}
      EOF
      map [d :lua vim.diagnostic.goto_prev()<CR>
      map ]d :lua vim.diagnostic.goto_next()<CR>
      nnoremap K :lua vim.lsp.buf.hover()<CR>

      " Completion
      lua << EOF
        local cmp = require('cmp')

        cmp.setup({
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }),
          sources = cmp.config.sources(
            { { name = 'nvim_lsp' }, }, 
            { { name = 'buffer' }, 
          })
        })
      EOF
    '';
    extraPackages = with pkgs; [
        lua-language-server
    ];
  };
}
