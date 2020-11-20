(require 'owi-package-management)

(use-package elpy)

(use-package company
  :init
  (advice-add 'python-mode :before 'elpy-enable)
 )

(provide 'owi-python)
