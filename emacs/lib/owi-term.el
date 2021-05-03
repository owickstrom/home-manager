(require 'owi-package-management)

(use-package vterm
  ; :bind (("C-x g" . magit-status))
  )

(use-package vterm-toggle
  :config
  (evil-global-set-key 'normal [f2] 'vterm-toggle)
  (evil-global-set-key 'normal [C-f2] 'vterm-toggle-cd)
  (evil-global-set-key 'insert [f2] 'vterm-toggle)
  (evil-global-set-key 'insert [C-f2] 'vterm-toggle-cd)

  ;; you can cd to the directory where your previous buffer file exists
  ;; after you have toggle to the vterm buffer with `vterm-toggle'.
  (define-key vterm-mode-map [(control return)]   #'vterm-toggle-insert-cd)

                                        ;Switch to next vterm buffer
  (define-key vterm-mode-map (kbd "M-s-n")   'vterm-toggle-forward)
                                        ;Switch to previous vterm buffer
  (define-key vterm-mode-map (kbd "M-s-p")   'vterm-toggle-backward)
  )

(provide 'owi-term)
