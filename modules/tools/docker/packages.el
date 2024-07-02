;; -*- no-byte-compile: t; -*-
;;; tools/docker/packages.el

(package! docker :pin "f3adbf49e1140d13c934f16e19754c42a97dc91f")

;; tramp-container (included with Emacs 29+) replaces docker-tramp
(package! docker-tramp
  :pin "19d0771db4e6b89e19c00af5806438e315779c15"
  :disable (>= emacs-major-version 29))

(package! dockerfile-mode
  :pin "39a012a27fcf6fb629c447d13b6974baf906714c"
  :disable (and (>= emacs-major-version 29)
                (modulep! +tree-sitter)))

(package! dockerfile-ts-mode
  :built-in t
  :disable (not (and (>= emacs-major-version 29)
                     (modulep! +tree-sitter))))
