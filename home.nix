{ config, pkgs, ... }: {

  imports = [
    ./bash.nix
    ./git.nix
    ./neovim.nix
    ./tmux.nix
    ./vscode.nix
    ./media.nix
    ./passwords.nix
    ./ikea.nix
    ./emacs.nix
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  news.display = "silent";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ (import pkgs/electronmail.nix) ];

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
  services.dropbox.enable = true;
  services.lorri.enable = true;

  xdg.enable = true;
  xdg.mime.enable = true;
  targets.genericLinux.enable = true;

  home.packages = with pkgs; [
    htop
    cachix
    ghcid
    tmux
    jq
    ripgrep
    nixfmt
    gitAndTools.hub
    direnv
    zoom-us
    electronmail
    tree
    vokoscreen
    vlc
    ffmpeg
    signal-desktop
    aws-cli

    # Fonts
    iosevka
    cascadia-code
  ];
}
