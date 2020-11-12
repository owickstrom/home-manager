(require 'owi-package-management)

(use-package yasnippet
  :init
  (setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))
  :config

  (yas-global-mode 1)

  (use-package yasnippet-snippets
    :config nil)
  (use-package haskell-snippets
    :config nil)
  )

(provide 'owi-yasnippet)
