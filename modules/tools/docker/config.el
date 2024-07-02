;;; tools/docker/config.el -*- lexical-binding: t; -*-

(use-package docker :defer t)

(use-package! dockerfile-mode :defer t)

(use-package! dockerfile-ts-mode
  :mode
  "\\(?:Dockerfile\\(?:\\..*\\)?\\|\\.[Dd]ockerfile\\|Containerfile\\)\\'"
  :defer t)

(after! (:or dockerfile-mode dockerfile-ts-mode)
  (set-docsets! 'dockerfile-mode "Docker")
  (set-docsets! 'dockerfile-ts-mode "Docker")
  (set-formatter! 'dockfmt '("dockfmt" "fmt" filepath) :modes '(dockerfile-mode dockerfile-ts-mode))

  (when (modulep! +lsp)
    (add-hook 'dockerfile-mode-local-vars-hook #'lsp! 'append)
    (add-hook 'dockerfile-ts-mode-local-vars-hook #'lsp! 'append)))
