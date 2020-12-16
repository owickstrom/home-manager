(require 'owi-package-management)

(use-package flycheck
  :bind
  ((:map flycheck-mode-map)
   ("M-p" . flycheck-previous-error)
   ("M-n" . flycheck-next-error))
  )

(provide 'owi-flycheck)
