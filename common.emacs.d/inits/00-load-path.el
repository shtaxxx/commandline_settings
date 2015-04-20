(defun prepend-path ( my-path )
  (setq load-path (cons (expand-file-name my-path) load-path)))
(defun append-path ( my-path )
  (setq load-path (append load-path (list (expand-file-name my-path)))))
(prepend-path "~/.emacs.d/elisp")

;; load-path for emacs23 or older
(cond
 ((< emacs-major-version 24)
  (prepend-path "~/.emacs.d/elisp23")))
