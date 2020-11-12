(require 'owi-package-management)
(require 'owi-company)
(require 'owi-flycheck)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  ;; add emmet (zen coding)
  (emmet-mode)
  (setq emmet-expand-jsx-className? t)
  )

(use-package typescript-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode)))

(use-package tide
  :after typescript-mode
  :config

  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)

  (add-hook 'typescript-mode-hook #'setup-tide-mode)

  :bind
  (:map typescript-mode-map
        ("C-c f" . tide-fix)
        ("C-c j" . tide-jump-to-definition)
        ("C-c C-j" . tide-jump-back)
        ))

(provide 'owi-typescript)
