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
      "update.channel" = "none";
      "[nix]"."editor.tabSize" = 2;
      "workbench.colorTheme" = "Atom One Dark";
      "workbench.preferredLightColorTheme" = "Atom One Light";
      "workbench.preferredDarkColorTheme" = "Atom One Dark";

    };
  };
}
