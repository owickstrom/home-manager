(require 'owi-package-management)

(use-package flycheck
  :bind
  ("M-p" . flycheck-previous-error)
  ("M-n" . flycheck-next-error)
  )

(provide 'owi-flycheck)
