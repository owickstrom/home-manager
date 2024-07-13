{
  config,
  pkgs,
  lib,
  ...
}:
{

  imports = [
    ./yabai.nix
    ./skhd.nix
    ./alacritty.nix
    ./ghostty.nix
    ./bat.nix

    ./zsh.nix
    ./git.nix
    ./vim.nix
    ./tmux.nix
    ./ctags.nix

    ./idea.nix
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # news.display = "silent";

  nix = {
    gc = {
      automatic = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.input-fonts.acceptLicense = true;

  nixpkgs.overlays = [ (import pkgs/electronmail.nix) ];
  targets.genericLinux.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "owi";
  home.homeDirectory = "/home/owi";

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

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Make sure to add these to ~/.config/nix/nix.conf:
  #
  #   keep-derivations = true
  #   keep-outputs = true

  home.packages =
    let
      devenv = (import (fetchTarball "https://github.com/cachix/devenv/archive/v0.6.3.tar.gz")).default;
    in
    with pkgs;
    [
      htop
      cachix
      ghcid
      tmux
      jq
      ripgrep
      xclip
      nixfmt-rfc-style
      tree
      awscli
      nix-prefetch-git
      bat
      delta
      difftastic
      # pandoc
      poetry
      shellcheck
      nodejs
      iosevka-bin
      jetbrains-mono
      yarn
      haskell-language-server
      nix-tree
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      pkgs.inter
      pkgs.commit-mono
      pkgs.input-fonts
    ];

  home.activation = {
    aliasApplications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      app_folder=$(echo ~/Applications);

      for app in $(ls "$genProfilePath/home-path/Applications"); do
        $DRY_RUN_CMD rm -f $app_folder/$app
        $DRY_RUN_CMD osascript -e "tell app \"Finder\"" -e "make new alias file at POSIX file \"$app_folder\" to POSIX file \"$genProfilePath/home-path/Applications/$app\"" -e "set name of result to \"$app\"" -e "end tell"
      done
    '';
  };
}
