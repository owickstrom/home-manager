(require 'owi-package-management)
(require 'owi-theming)

(defun configure-fstar-background ()
  (let ((bg (face-attribute 'default :background)))
    (print bg)
    (custom-theme-set-faces
     'user
     `(fstar-subp-overlay-processed-face ((t (:background ,bg))))
     ))
  )

(use-package fstar-mode
  :config
  (configure-fstar-background)
  )

(provide 'owi-fstar)
