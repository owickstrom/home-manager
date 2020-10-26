{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    slack
    adoptopenjdk-hotspot-bin-11
    jetbrains.idea-community
    google-cloud-sdk
    docker
  ];

  programs.chromium.enable = true;
}
