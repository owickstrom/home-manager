(require 'owi-package-management)

(use-package elpy
  :config
  (setq elpy-rpc-timeout 10)

  :bind
  (("C-S-i" . elpy-format-code)))

(use-package company
  :init
  (advice-add 'python-mode :before 'elpy-enable)
 )

(use-package flymake
  :bind
  ((:map flymake-mode-map)
   ("M-p" . flymake-goto-prev-error)
   ("M-n" . flymake-goto-next-error)
   ))

(use-package poetry
  :config
  (poetry-tracking-mode)
 )

(provide 'owi-python)
