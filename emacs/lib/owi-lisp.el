(require 'owi-package-management)

(use-package paredit
  :config
  ;; Auto load paredit in LISP buffers
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'rainbow-delimiters-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  (add-hook 'geiser-repl-mode-hook      #'enable-paredit-mode)
  )

(provide 'owi-lisp)
