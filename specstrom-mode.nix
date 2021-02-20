{ pkgs }:
pkgs.emacsPackages.trivialBuild {
  pname = "specstrom-mode";
  version = "0";

  src = "${
      fetchTarball
      "https://github.com/quickstrom/specstrom/archive/95632e314064e94c69d1bfc26c69adc93069d60e.tar.gz"
    }/emacs";

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp $src/specstrom-mode.el $out/share/emacs/site-lisp/
  '';
}
