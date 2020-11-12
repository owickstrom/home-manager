(require 'owi-package-management)
(require 'owi-company)
(require 'owi-flycheck)

(use-package tuareg
  :ensure t)

(use-package merlin
  :config
  (add-hook 'tuareg-mode-hook 'merlin-mode)
  (add-hook 'merlin-mode-hook #'company-mode)
  (setq merlin-error-after-save nil)
  (add-hook 'merlin-mode-hook (lambda () (flycheck-ocaml-setup)))
  (add-hook 'merlin-mode-hook 'flycheck-mode))

(use-package flycheck-ocaml
  :after merlin
  :config
  (flycheck-ocaml-setup))


(provide 'owi-ocaml)
