(require 'owi-package-management)

(use-package projectile
  :config
  (projectile-mode +1)
  (add-hook 'kotlin-mode-hook
            (lambda ()
              (add-to-list
               'compilation-error-regexp-alist
               '("^e: \\(.*?\\): (\\([0-9]+\\), \\([0-9]+\\)): .*$" 1 2 3))
              ))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-test-suffix-function 'my-projectile-test-suffix)
  )

(defun my-projectile-test-suffix (project-type)
  (cond
   ((member project-type '(haskell-cabal haskell-stack nix generic)) "Test")
   ((member project-type '(gradlew gradle)) "Test")
   (t (projectile-test-suffix project-type))))

(provide 'owi-projectile)
