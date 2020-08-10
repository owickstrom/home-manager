{ config, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "owi";
  home.homeDirectory = "/home/owi";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = with pkgs; [
    htop
    cachix
    lorri
    ghcid
    tmux
  ];

  programs.bash = {
    enable = true;
    historyIgnore = [ "l" "ls" "cd" "exit" ];
    historyControl = [ "erasedups" ];
    enableAutojump = true;
    shellAliases = {
      ll = "ls -l";
      lla = "ls -la";
      g = "git";
      gs = "git status";
      e = "eval $EDITOR";
    };
    initExtra = ''
    if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
      . ~/.nix-profile/etc/profile.d/nix.sh;
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
    fi # added by Nix installer
    '';
  };

  programs.git = {
    enable = true;
    userName  = "owickstrom";
    userEmail = "oskar@wickstrom.tech";
    ignores = [ ];
    aliases = {
      co = "checkout";
      ci = "commit";
      cp = "commit -p";
      s = "status";
      st = "status";
      d = "diff";
      pr = "pull --rebase";
      ps = "push";
      l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
    };
    extraConfig = {
      core.editor = "nvim";
      credential.helper = "store --file ~/.git-credentials";
      pull.rebase = "false";
    };
  };	
	
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      awesome-vim-colorschemes
      vim-nix
    ];
    extraConfig = ''
      " General
      set nocompatible            " get rid of Vi compatibility mode. SET FIRST!
      filetype plugin indent on   " filetype detection[ON] plugin[ON] indent[ON]
      syntax enable               " enable syntax highlighting (previously syntax on).
      
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
      set nowrap                  " don't wrap text
      
      " Leader
      let mapleader = ','
      let maplocalleader = ','
      
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
      
      set termguicolors
      colorscheme paramount
    '';
  };

  programs.tmux = {
    enable = true;
    shortcut = "C-]";
    baseIndex = 1; # Widows numbers begin with 1
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    aggressiveResize = true;
    historyLimit = 100000;
    resizeAmount = 5;
    escapeTime = 0;
    terminal = "screen-256color";
  
    extraConfig = ''
      # enable terminal compability
      set-option -ga terminal-overrides ",screen-256color:Tc"

      # Better splitting commands.
      unbind %
      bind | split-window -h
      bind - split-window -v

      # Subtle bottom bar color.
      set -g status-bg colour7
      set -g status-fg colour0
    '';
  
  };
  
  services.dropbox = {
    enable = true;
  };
}
