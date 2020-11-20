(require 'owi-package-management)

(use-package nix-mode
  :bind
  (:map nix-mode-map
        ("C-S-i" . nix-format-buffer)))

(provide 'owi-nix)
