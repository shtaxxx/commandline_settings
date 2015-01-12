(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(require 'cl)
(defvar installing-package-list
  '(
    auto-complete
    gtags
    flymake
    flymake-cursor
    markdown-mode
    markdown-mode+
    python-mode
    epc
    python-environment
    jedi
    jinja2-mode
    go-mode
    go-autocomplete
    scala-mode2
    haskell-mode
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
