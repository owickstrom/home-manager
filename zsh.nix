{ config, lib, pkgs, ... }:
{
  programs.zsh = {
    defaultKeymap = "emacs";
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
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

      export EDITOR=vim

      [ -f "/Users/owi/.ghcup/env" ] && source "/Users/owi/.ghcup/env" # ghcup-env

      eval "$(direnv hook zsh)"
    '';
    profileExtra = ''
      export XDG_DATA_DIRS=$HOME/.nix-profile/share:/usr/local/share:/usr/share

      [ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

      export PATH=$PATH:$HOME/.local/bin

      # If you need to have llvm first in your PATH, run:
      export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

      # For compilers to find llvm you may need to set:
      export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
      export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
    '';
  };

  programs.autojump.enable = true;
}