(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(require 'cl)

;; for old emacs versions
(defvar installing-package-list
  '(
    exec-path-from-shell
    auto-complete
    gtags
    ))

;; for emacs 24 or later
(when (>= emacs-major-version 24)
  (setq installing-package-list
        (append installing-package-list
                '(
                  flymake
                  flymake-cursor
                  anzu
                  expand-region
                  multiple-cursors
                  smartrep
                  markdown-mode
                  markdown-mode+
                  python-mode
                  python-environment
                  epc
                  jedi
                  go-mode
                  go-autocomplete
                  scala-mode2
                  haskell-mode
                  jinja2-mode
                  ))))

(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
