(require 'owi-package-management)

(use-package ido
  :config
  (setq ido-enable-flex-matching t)
  (ido-everywhere t)
  (ido-mode 1)

  ;; disable auto searching for files unless called explicitly with C-c
  ;; C-s
  ;;
  ;; from https://superuser.com/a/322790
  (setq ido-auto-merge-delay-time 99999)
  (define-key ido-file-dir-completion-map (kbd "C-c C-s")
    (lambda()
      (interactive)
      (ido-initiate-auto-merge (current-buffer))))

  )

(provide 'owi-ido)
