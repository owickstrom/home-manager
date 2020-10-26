{ config, lib, pkgs, ... }:
{
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
      gaa = "git add --all";
      gd = "git diff";
      gdc = "git diff --cached";
      e = "eval $EDITOR";
    };
    initExtra = ''
      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh;
        export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
      fi # added by Nix installer

      export XDG_DATA_DIRS=$HOME/.nix-profile/share:/usr/local/share:/usr/share

      eval "$(direnv hook bash)"
    '';
  };
}