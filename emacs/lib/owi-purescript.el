(require 'owi-package-management)

(use-package psc-ide
  :ensure t)

(use-package purescript-mode

  :init
  (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)
  (add-hook 'purescript-mode-hook 'psc-ide-mode)
  ;; (add-hook 'purescript-mode-hook 'flycheck-mode)
  )

(provide 'owi-purescript)
