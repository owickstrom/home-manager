; (defvar gradle-build-directory nil "Directory in which to run gradle commands")

(require 'compile)

(use-package kotlin-mode
  :bind
  (:map kotlin-mode-map
        (("C-c C-c". my/gradlew-build)
         ("C-c C-t". my/gradlew-test)))
  )

(defvar gradle-build-directory nil "Base directory used when invoking gradle")

(defun my/gradlew-find-project-root ()
  (or
   gradle-build-directory
   (locate-dominating-file default-directory "settings.gradle.kts")
   (locate-dominating-file default-directory "settings.gradle"))
  )

(defun my/gradlew-find-nearest-module ()
  (or
   gradle-build-directory
   (locate-dominating-file default-directory "build.gradle.kts")
   (locate-dominating-file default-directory "build.gradle")))

(defun my/gradlew-run-command (&rest args)
  (interactive)
  (add-to-list
   'compilation-error-regexp-alist
   '("^e: \\(.*?\\): (\\([0-9]+\\), \\([0-9]+\\)): .*$" 1 2 3))
  (if-let ((project-directory (my/gradlew-find-nearest-module))
           (project-root (my/gradlew-find-project-root)))
      (let ((default-directory project-directory))
        (compile (string-join (append
                               (list (expand-file-name "gradlew" project-root)
                                     "-p" project-directory)
                               args)
                              " ")))
    (message "Couldn't find Gradle build file above " default-directory)))

(defun my/gradlew-build ()
  (interactive)
  (my/gradlew-run-command "build -x test"))

(defun my/gradlew-test ()
  (interactive)
  (my/gradlew-run-command "test"))

(provide 'owi-gradle)
