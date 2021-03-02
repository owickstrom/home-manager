(require 'owi-package-management)
(require 'owi-projectile)

(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)

  :config ;; tweak evil after loading it
  (evil-mode)

  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "C-c C-u") 'universal-argument)
  (define-key evil-normal-state-map (kbd "C-c C--") 'negative-argument)
  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)

  (evil-set-initial-state 'term-mode 'emacs)
  )

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(provide 'owi-evil)
