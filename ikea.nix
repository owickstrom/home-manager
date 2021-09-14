{ config, pkgs, ... }:
let
  terraform = let version = "0.14.11";
  in pkgs.stdenv.mkDerivation {
    name = "terraform";
    src = pkgs.fetchzip {
      url =
        "https://releases.hashicorp.com/terraform/${version}/terraform_${version}_darwin_amd64.zip";
      sha256 = "0590mx1pfr334j4qbrvz3pih8rg1ycq5wn24vbdhn9jvibgknpz1";
    };
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/bin
      cp $src/* $out/bin/
      chmod +x $out/bin/*
    '';
  };
in { home.packages = with pkgs; [ terraform ]; }
