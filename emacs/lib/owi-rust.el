(require 'owi-flycheck)
(require 'owi-company)

(defun my-rust-mode-hook ()
  (flycheck-mode)
  (flycheck-rust-setup)
  )

(use-package rust-mode

  :mode ("\\.rs\\'" . rust-mode)

  :config
  (use-package flycheck-rust :ensure t)
  (use-package cargo :ensure t)
  (add-hook 'rust-mode-hook #'my-rust-mode-hook)
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package company-lsp
  :config
  (push 'company-lsp company-backends))

(provide 'owi-rust)
