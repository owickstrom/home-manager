{ config, lib, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    haskell = {
      enable = true;
      hie.enable = false;
    };
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace
      (import ./vscode-extensions.nix).extensions;
    userSettings = {
      # Basics
      "update.channel" = "none";
      "[nix]"."editor.tabSize" = 2;
      # Sundial
      "window.autoDetectColorScheme" = "false";
      "sundial.latitude" = "";
      "sundial.longitude" = "55.815";
      "workbench.colorTheme" = "13.0227";
      "workbench.preferredLightColorTheme" = "Atom One Light";
      "workbench.preferredDarkColorTheme" = "Atom One Dark";
      # Terminal
      "terminal.integrated.allowChords" = "false";
      "terminal.integrated.commandsToSkipShell" = [
        "-workbench.action.terminal.focusFindWidget"
        "-workbench.action.terminal.clear"
        "-workbench.action.quickOpen"
      ];
    };
  };
}
