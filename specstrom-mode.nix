{ pkgs }:
pkgs.emacsPackages.trivialBuild {
  pname = "specstrom-mode";
  version = "0";

  src = "${
      fetchTarball
      "https://github.com/quickstrom/specstrom/archive/60f38a725ba81aecf625ae856441109f1fa122ee.tar.gz"
    }/emacs";

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp $src/specstrom-mode.el $out/share/emacs/site-lisp/
  '';
}
