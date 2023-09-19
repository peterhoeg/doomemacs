;;; tools/docker/config.el -*- lexical-binding: t; -*-

(use-package dockerfile-mode
  :if (not (and (fboundp 'treesit-available-p)
                (treesit-available-p)
                (modulep! +tree-sitter)))
  :defer t)

(use-package dockerfile-ts-mode
  :if (and (fboundp 'treesit-available-p)
           (treesit-available-p)
           (modulep! +tree-sitter))
  :mode
  "\\(?:Dockerfile\\(?:\\..*\\)?\\|\\.[Dd]ockerfile\\|Containerfile\\)\\'"
  :defer t)

(use-package docker :defer t)

(after! (:or dockerfile-mode dockerfile-ts-mode)
  (set-docsets! 'dockerfile-mode "Docker")
  (set-docsets! 'dockerfile-ts-mode "Docker")
  (set-formatter! 'dockfmt '("dockfmt" "fmt" filepath) :modes '(dockerfile-mode dockerfile-ts-mode))

  (when (modulep! +lsp)
    (add-hook 'dockerfile-mode-local-vars-hook #'lsp! 'append)
    (add-hook 'dockerfile-ts-mode-local-vars-hook #'lsp! 'append)))
