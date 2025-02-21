{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [ pkgs.gitAndTools.gh ];
  programs.git = {
    enable = true;
    userName = "Oskar Wickström";
    userEmail = "oskar@wickstrom.tech";
    ignores = [
      ".vimrc"
      ".vscode"
      ".direnv"
      ".dir-locals.el"
      "TAGS"
      ".zed"
      ".idea"
      ".classpath"
      ".project"
      ".settings"
    ];
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

      # `git diff` with difftastic.
      d = "-c diff.external=difft diff";
      dc = "-c diff.external=difft diff --cached";

      # `git log` with patches shown with difftastic.
      dl = "-c diff.external=difft log -p --ext-diff";
      # Show the most recent commit with difftastic.
      ds = "-c diff.external=difft show --ext-diff";

      pl = "pull";
      ps = "push";
      h = "git log --graph --pretty=oneline --abbrev-commit";
      l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
    };
    extraConfig = {
      core.editor = "vim";
      credential.helper = "store --file ~/.git-credentials";
      pull.rebase = "false";
      github.user = "owickstrom";
      push.autoSetupRemote = true;
      merge.tool = "nvimdiff";
      merge.conflictstyle = "diff3";
      mergetool.hideResolved = true;
      mergetool.keepBackup = false;
      mergetool.nvimdiff.layout = "LOCAL,MERGED,REMOTE";
      mergetool.nvimdiff.trustExitCode = false;
    };
  };
}
