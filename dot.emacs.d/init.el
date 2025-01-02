;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; cl-lib
(use-package cl-lib)

;; color
(use-package color)

;; default directory
(setq default-directory "~/")
(setq command-line-default-directory "~/")

;; custom-set-variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; basic
(global-font-lock-mode t)
(line-number-mode t)
(column-number-mode t)
(display-time)

(setq make-backup-files nil)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq next-line-add-newlines nil)
(setq require-final-newline t)
(setq max-lisp-eval-depth 10000)
(setq vc-handled-backends ())

(setq-default transient-mark-mode t)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; encoding
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-default 'buffer-file-coding-system 'utf-8)

;; keybind
(define-key global-map (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-o") 'goto-line)

;; exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :init
  (custom-set-variables '(exec-path-from-shell-check-startup-files nil))
  (exec-path-from-shell-initialize)
  (let ((envs '("PATH" "GOPATH"))) (exec-path-from-shell-copy-envs envs)))

;; whitespace
(use-package whitespace
  :ensure t
  :config
  (setq whitespace-style '(face
                           trailing
                           ; tabs
                           ; empty
                           space-mark
                           ; tab-mark
                           ))
  (setq whitespace-display-mappings
        '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (global-whitespace-mode 1))

;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook prog-mode
  :config
  (defun rainbow-delimiters-using-stronger-colors ()
    (interactive)
    (cl-loop
     for index from 1 to rainbow-delimiters-max-face-count
     do
     (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
       (cl-callf color-saturate-name (face-foreground face) 30))))
  (add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors))

;; smartrep (smart repeat)
(use-package smartrep
  :ensure t
  :config
  (global-unset-key "\C-o")
  (smartrep-define-key
      global-map "C-o" '(("C-n" . 'mc/mark-next-like-this)
                         ("C-p" . 'mc/mark-previous-like-this)
                         ("*"   . 'mc/mark-all-like-this))))

;; multiple-cursors
(use-package multiple-cursors
  :ensure t
  :bind ("<C-M-return>" . mc/edit-lines))

;; expand-region
(use-package expand-region
  :ensure t
  :bind (("C--" . er/expand-region)
         ("C-M--" . er/contract-region))
  :config
  (defadvice isearch-mode (around
                           isearch-mode-default-string
                           (forward &optional regexp op-fun recursive-edit word-p)
                           activate)
    (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
        (progn
          (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
          (deactivate-mark)
          ad-do-it
          (if (not forward)
              (isearch-repeat-backward)
            (goto-char (mark))
            (isearch-repeat-forward)))
      ad-do-it)))

;; anzu (search extension)
(use-package anzu
  :ensure t
  :init (global-anzu-mode +1)
  :bind ("C-x t" . anzu-query-replace-regexp)
  :config
  (setq anzu-deactivate-region t)
  (setq anzu-search-threshold 1000)
  (setq anzu-minimum-input-length 3))

;; init-loader
(use-package init-loader
  :ensure t
  :config
  (setq init-loader-show-log-after-init 'error-only)
  (init-loader-load "~/.emacs.d/init-loader-inits"))
