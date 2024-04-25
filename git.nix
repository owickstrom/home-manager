{ config, lib, pkgs, ... }: {
  home.packages = [ pkgs.gitAndTools.gh ];
  programs.git = {
    enable = true;
    userName = "Oskar Wickström";
    userEmail = "oskar@wickstrom.tech";
    ignores = [ ".vscode" ".direnv" ".dir-locals.el" "TAGS" ];
    aliases = {
      aa = "add --all";
      br = "branch";
      co = "checkout";
      c = "commit -m";
      ci = "commit";
      cl = "clean";
      cp = "commit -p";
      s = "status";
      st = "status";
      d = "diff";
      dc = "diff --cached";
      pl = "pull";
      ps = "push";
      l =
        "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
    };
    extraConfig = {
      core.editor = "vim";
      credential.helper = "store --file ~/.git-credentials";
      pull.rebase = "false";
      github.user = "owickstrom";
      push.autoSetupRemote = true;
      diff.external = "difft";
    };
  };
}
