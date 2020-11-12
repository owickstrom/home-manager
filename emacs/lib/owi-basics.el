(setenv "PATH" (concat (getenv "PATH") ":~/.local/bin"))
(setq exec-path (append exec-path '("~/.local/bin")))

(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq inhibit-startup-screen t)

;; Use spaces for indent
(setq-default indent-tabs-mode nil)
;; But not for Makefiles
(add-hook 'makefile-mode-hook
          (lambda ()
            (setq-local indent-tabs-mode t)))

;; Disable creation of .#<file> lockfiles
(setq create-lockfiles nil)

;; Don't show weird fringe characters for empty lines.
(setq-default indicate-empty-lines nil)

;; Remove big white square in Aquamacs
(setq visible-bell nil)
(setq ring-bell-function (lambda nil (message "")))

;; Use case-sensitive search by default
(setq-default case-fold-search nil)

;; Disable macOS make-frame binding
(global-unset-key (kbd "s-n"))

(blink-cursor-mode 0)

;; Use a plain window instead of a new frame for the ediff controls.
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Text scaling
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Spaces, please
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; allow remembering risky variables
(defun risky-local-variable-p (sym &optional _ignored) nil)

;; Require confirmation before exiting Emacs
(setq confirm-kill-emacs #'yes-or-no-p)

(provide 'owi-basics)

(setq package-check-signature nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
