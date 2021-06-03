{ config, lib, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    historyIgnore = [ "l" "ls" "cd" "exit" ];
    historyControl = [ "erasedups" ];
    shellAliases = {
      ll = "ls -l";
      lla = "ls -la";
      g = "git";
      gs = "git status";
      gaa = "git add --all";
      gd = "git diff";
      gdc = "git diff --cached";
      gps = "git push";
      gpl = "git pull";
      gh = "git log --graph --pretty=oneline --abbrev-commit";
      e = "eval $EDITOR";
      copy-to-clipboard = "xclip -selection clipboard";
    };
    initExtra = ''
      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh;
        export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
      fi # added by Nix installer

      source $HOME/.nix-profile/share/bash-completion/completions/git-prompt.sh
      PS1='\[\033[0;31m\]\w\[\033[0;32m\]$(__git_ps1)\[\e[0m\]$ '

      export EDITOR=vim

      eval "$(direnv hook bash)"
    '';
    profileExtra = ''
      export XDG_DATA_DIRS=$HOME/.nix-profile/share:/usr/local/share:/usr/share

      export PATH=$PATH:$HOME/.local/bin
    '';
  };

  programs.autojump.enable = true;
}
