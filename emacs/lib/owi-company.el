(require 'owi-package-management)

(use-package company
  :init
  (setq company-dabbrev-downcase nil)
  (setq company-minimum-prefix-length 2)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (add-to-list 'company-backends '(company-dabbrev))
  (global-set-key (kbd "C-SPC") 'company-complete-common)
  )

(provide 'owi-company)
