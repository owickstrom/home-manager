{ config, lib, pkgs, ... }: {
  programs.emacs = {
    enable = true;
    extraPackages = epkgs:
      with epkgs; [
        magit
        evil-magit
        typescript-mode
        tide
        evil
        kotlin-mode
        paredit
        projectile
        rg
        rust-mode
        company-lsp
        mixed-pitch
        company
        nix-mode
        direnv
        emmet-mode
        undo-tree
        writeroom-mode
        yasnippet
        yasnippet-snippets
        haskell-snippets
        flycheck
        company
        exec-path-from-shell
        fstar-mode
        psc-ide
        purescript-mode
        flycheck-haskell
        haskell-mode
        markdown-mode
        tuareg
        merlin
        flycheck-ocaml
        atom-one-dark-theme
        minimal-theme
        doom-themes
        solaire-mode
      ];
  };

  home.file.".emacs.d" = {
    source = ./emacs;
    recursive = true;
  };
}
