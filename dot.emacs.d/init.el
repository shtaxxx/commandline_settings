;; load-path
(defun prepend-path ( my-path )
  (setq load-path (cons (expand-file-name my-path) load-path)))
(defun append-path ( my-path )
  (setq load-path (append load-path (list (expand-file-name my-path)))))

;; for emacs 24 and later
(cond
 ((>= emacs-major-version 24)
  (prepend-path "~/.emacs.d/elisp")))

;; for emacs 23 and older
(cond
 ((< emacs-major-version 24)
  (prepend-path "~/.emacs.d/elisp23")))

;; custom-set-variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; package
(require 'cl)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; packages for emacs 23 and older
(defvar installing-package-list
  '(
    init-loader
    exec-path-from-shell
    ))

;; packages for emacs 24 and later
(when (>= emacs-major-version 24)
  (setq installing-package-list
        (append installing-package-list
                '(
                  anzu
                  expand-region
                  multiple-cursors
                  powerline
                  rainbow-delimiters
                  smartrep
                  auto-complete
                  flycheck
                  ggtags
                  google-c-style
                  auto-complete-clang-async
                  python-environment
                  jedi
                  py-autopep8
                  go-mode
                  go-autocomplete
                  rust-mode
                  ac-racer
                  cuda-mode
                  opencl-mode
                  scala-mode
                  jinja2-mode
                  markdown-mode
                  yatex
                  ))))

;; automatic install 
(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
