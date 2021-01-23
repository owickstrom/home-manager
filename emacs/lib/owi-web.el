(require 'owi-package-management)

(use-package web-mode

  :mode ("\\.html?$"
         "\\.html.eex$")

  :init
  (add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))

  (setq web-mode-engines-alist
        '(("elixir" . "\\.html\\.eex\\'")))
  )

(use-package emmet-mode
  :mode ("\\.html?$"
         "\\.html.eex$")
  )

(provide 'owi-web)
