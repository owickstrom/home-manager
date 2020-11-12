(defcustom haskell-tasty-command "cabal v2-run tasty --"
  "Command that runs a Tasty test suite (set up by tasty-discover)")

;; TODO: Accept prefix command for edit
(defun haskell-tasty--run-with-pattern-fn (make-pattern)
  (let ((module-file-name (file-truename (buffer-file-name))))
    (when-let (cabal-dir (or (haskell-cabal-find-dir)
                             (locate-dominating-file default-directory "cabal.project")
                             (locate-dominating-file default-directory "cabal.project.local")
                             (locate-dominating-file default-directory "cabal.project.freeze")))
      ;; TODO: Capture stderr for potential error messages
      (when-let (tasty-pattern (funcall make-pattern module-file-name))
	(let ((command-with-pattern (format "%s -p '%s'"
					    haskell-tasty-command
					    tasty-pattern))
	      (name (file-name-base (directory-file-name cabal-dir)))
	      (default-directory cabal-dir))
	  (compilation-start
	   command-with-pattern
	   'haskell-compilation-mode
	   (lambda (mode) (format "*%s* <%s>" mode name))))))))

(defun haskell-tasty-run-test-at-point ()
  (interactive)
  (save-some-buffers (not compilation-ask-about-save) compilation-save-buffers-predicate)
  (let ((line-nr (count-lines 1 (point))))
    (haskell-tasty--run-with-pattern-fn (lambda (module-file-name)
					  (string-trim
					   (shell-command-to-string
					    (format "tasty-discover-test-pattern fast-tags %s %d"
						    module-file-name
						    line-nr)))))))

(defun haskell-tasty-run-tests-in-module ()
  (interactive)
  (save-some-buffers (not compilation-ask-about-save) compilation-save-buffers-predicate)
  (haskell-tasty--run-with-pattern-fn (lambda (module-file-name)
					(string-trim
					 (shell-command-to-string
					  (format "tasty-discover-test-pattern fast-tags %s"
						  module-file-name))))))

(provide 'owi-tasty-run)
