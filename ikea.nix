{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    slack
    adoptopenjdk-hotspot-bin-11
    jetbrains.idea-ultimate
    google-cloud-sdk
    nodejs-14_x
  ];

  programs.chromium.enable = true;

  xdg.enable = true;
  xdg.mime.enable = true;
  targets.genericLinux.enable = true;
}
