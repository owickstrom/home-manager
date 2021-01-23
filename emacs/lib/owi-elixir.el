(require 'owi-package-management)

(use-package ruby-end)

(use-package elixir-mode
  :after (ruby-end)

  :hook ((elixir-mode . smartparens-mode)
         (elixir-mode . ruby-end-mode))

  :bind
  ((:map elixir-mode-map)
   ("C-S-i" . elixir-format)))

(provide 'owi-elixir)
