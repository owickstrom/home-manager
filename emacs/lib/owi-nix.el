(require 'owi-package-management)

(use-package nix-mode
  :bind
  (("C-S-i" . nix-format-buffer)))

(provide 'owi-nix)
