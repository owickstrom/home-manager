(require 'org)

;; Use org-mode for Scratch buffer.
(setq initial-major-mode 'org-mode)

(setq initial-scratch-message "\
#+TITLE: Scratch

# This Scratch buffer (with org-mode enabled) is for notes you don’t
# want to save.  If you want to create a file, visit that file with
# C-x C-f, then enter the text in that file’s own buffer.
")

;; Fontify the whole line for headings (with a background color).
(setq org-fontify-whole-heading-line t)

;; Fontify source code blocks.
(setq org-src-fontify-natively t)

(use-package mixed-pitch
  :hook (org-mode . mixed-pitch-mode))

(setq org-preview-latex-default-process 'dvisvgm)

(setq org-format-latex-options
      (plist-put org-format-latex-options :scale 2.0))

(provide 'owi-org)
