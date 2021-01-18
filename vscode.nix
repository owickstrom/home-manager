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
      "editor.fontFamily" = "Cascadia Code";
      "editor.fontSize" = 13;
      # Theme
      "window.autoDetectColorScheme" = "true";
      "workbench.colorTheme" = "Atom One Dark";
      "workbench.preferredLightColorTheme" = "Atom One Dark";
      "workbench.preferredDarkColorTheme" = "Atom One Dark";
      # Terminal
      "terminal.integrated.allowChords" = "false";
      "terminal.integrated.commandsToSkipShell" = [
        "-workbench.action.terminal.focusFindWidget"
        "-workbench.action.terminal.clear"
        "-workbench.action.quickOpen"
      ];
      "idris.idrisPath" = "${pkgs.idris2}/bin/idris2";
      "idris.idris2Mode" = true;
      "emmet.includeLanguages" = { "html-eex" = "html"; };
      "window.menuBarVisibility" = "toggle";
    };
    keybindings = [
      {
        key = "alt+n";
        command = "editor.action.marker.next";
      }
      {
        key = "alt+shift+n";
        command = "editor.action.marker.nextInFiles";
      }
      {
        key = "alt+p";
        command = "editor.action.marker.prev";
      }
      {
        key = "alt+shift+p";
        command = "editor.action.marker.prevInFiles";
      }
    ];
  };
}
