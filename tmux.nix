{
  config,
  lib,
  pkgs,
  ...
}:
{
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
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";

    extraConfig = ''
      # enable terminal compability
      set-option -ga terminal-overrides ",screen-256color:Tc"

      # Better splitting commands.
      unbind %
      bind | split-window -h
      bind - split-window -v

      # Subtle bottom bar color.
      set -g status-bg colour8
      set -g status-fg colour0
    '';
  };
}
