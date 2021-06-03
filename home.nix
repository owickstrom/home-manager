{ config, pkgs, lib, ... }: {

  imports = [
    # ./bash.nix
    ./git.nix
    ./vim.nix
    ./tmux.nix

    # ./vscode.nix
    # ./media.nix
    # ./passwords.nix
    # ./ikea.nix

    ./emacs.nix
    # ./regolith.nix
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  news.display = "silent";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ (import pkgs/electronmail.nix) ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "oswic";
  home.homeDirectory = "/Users/oswic";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  fonts.fontconfig.enable = true;
  # services.dropbox.enable = true;
  # services.lorri.enable = true;

  programs.direnv.enable = true;
  programs.direnv.enableNixDirenvIntegration = true;

  # Make sure to add these to ~/.config/nix/nix.conf:
  #
  #   keep-derivations = true
  #   keep-outputs = true

  # xdg.enable = true;
  # xdg.mime.enable = true;
  # targets.genericLinux.enable = true;

  # https://github.com/nix-community/home-manager/issues/354#issuecomment-475803163
  # home.sessionVariables.LOCALES_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";

  home.packages = with pkgs; [
    htop
    cachix
    ghcid
    tmux
    jq
    ripgrep
    xclip
    nixfmt
    gitAndTools.hub
    tree
    awscli
    nix-prefetch-git
    # pandoc

    # Fonts
    iosevka
  ];

  home.activation = {
    aliasApplications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      app_folder=$(echo ~/Applications);
      
      for app in $(ls "$genProfilePath/home-path/Applications"); do
        echo $app
        $DRY_RUN_CMD rm -f $app_folder/$app
        $DRY_RUN_CMD osascript -e "tell app \"Finder\"" -e "make new alias file at POSIX file \"$app_folder\" to POSIX file \"$genProfilePath/home-path/Applications/$app\"" -e "set name of result to \"$app\"" -e "end tell"
      done
    '';
  };
}
