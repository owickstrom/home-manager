{ pkgs }:
pkgs.emacsPackages.trivialBuild {
  pname = "specstrom-mode";
  version = "0";

  src = "${
      fetchTarball
      "https://github.com/quickstrom/specstrom/archive/292c8d64e915b4df9e309d993e65336d3e983965.tar.gz"
    }/emacs";

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp $src/specstrom-mode.el $out/share/emacs/site-lisp/
  '';
}
