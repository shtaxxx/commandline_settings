(global-font-lock-mode t)
(setq inhibit-startup-message t) 
(setq make-backup-files nil)
(setq initial-scratch-message "")
(display-time)
(line-number-mode t)
(column-number-mode t)
(setq next-line-add-newlines nil)

;; MAX depth of recursive call
(setq max-lisp-eval-depth 10000)

;; disable vc-mode (version control)
(setq vc-handled-backends ())

(setq-default transient-mark-mode t)
(setq-default c-basic-offset 2
              tab-width 2
              indent-tabs-mode nil)
(setq make-backup-files nil)
(setq require-final-newline t)
