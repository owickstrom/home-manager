(require 'owi-package-management)
(require 'owi-projectile)
(require 'owi-evil)
(require 'owi-tasty-run)

(use-package haskell-mode
  :init
  (setq-default haskell-compile-cabal-build-command "cabal build all")
  (setq-default haskell-compile-cabal-build-alt-command "TASTY_pattern=\"\" cabal test all")
  (setq-default haskell-process-type 'ghci)
  (setq-default haskell-process-log t)
  (setq-default haskell-process-args-ghci '("-ferror-spans" "-fshow-loaded-modules"))
  (setq-default haskell-font-lock-symbols nil)
  (setq-default haskell-stylish-on-save t)

  :mode
  ("\\.l?hs$" . haskell-mode)

  :bind
  (:map haskell-mode-map
	("C-c c" . haskell-compile)
	("C-c C-c" . haskell-compile)
	("C-c t"   . haskell-mode-show-type-at)
	("C-c g d" . haskell-mode-goto-loc)
	("C-c C-z" . haskell-interactive-switch)
	("C-c C-l" . haskell-process-load-or-reload))

  :config
  (haskell-indentation-mode 1)
  
  (add-hook 'haskell-mode-hook
	          (lambda ()
	            (setq projectile-tags-command "fast-tags -Re --exclude=.stack-work --exclude=dist-newstyle .")
	            (haskell-auto-insert-module-template)
              (lsp)
	            (paredit-mode)
              ;; (add-to-list 'haskell-compilation-error-regexp-alist
              ;;              '("✗ .*? failed at \\(.*?\\):\\([0-9]+\\):\\([0-9]+\\)" 1 2 3 2 nil))
              ))
  (add-hook 'haskell-literate-mode-hook #'lsp)
  )

(evil-set-initial-state 'interactive-haskell-mode 'emacs)
(evil-set-initial-state 'haskell-error-mode 'emacs)

(defun stack2cabal ()
  "Prepare a stack project for use with cabal."
  (interactive)
  (when-let
      (default-directory (locate-dominating-file default-directory "stack.yaml"))
    (call-process "stack2cabal")))

(use-package lsp
  :bind
  (("C-S-i" . lsp-format-buffer)
   ("C-c f" . lsp-ui-sideline-apply-code-actions)))

(use-package lsp-ui)

(use-package lsp-haskell
  :config
  (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper"))

(provide 'owi-haskell)
