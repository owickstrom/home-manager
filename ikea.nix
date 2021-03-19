{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    slack
    nodejs-14_x
  ];

  programs.chromium.enable = true;
}
