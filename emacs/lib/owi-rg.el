(require 'owi-package-management)

(use-package rg
  :config
  (global-set-key (kbd "C-c g g") 'rg)
  (global-set-key (kbd "C-c g p") 'rg-project)
  )

(provide 'owi-rg)
