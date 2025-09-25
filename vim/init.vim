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

set bg=light
let g:bones_compat = 1
colorscheme zenwritten

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

luafile /home/owi/.config/home-manager/vim/keymap.lua
luafile /home/owi/.config/home-manager/vim/completion.lua
luafile /home/owi/.config/home-manager/vim/formatting.lua
luafile /home/owi/.config/home-manager/vim/git.lua
luafile /home/owi/.config/home-manager/vim/lsp.lua

