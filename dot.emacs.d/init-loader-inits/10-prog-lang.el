;; company (auto completion)
(use-package company
  :ensure t
  :bind (("M-<tab>" . company-complete)
         :map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ("C-s" . company-filter-candidates)
         ("C-i" . company-complete-selection)
         ("C-f" . company-complete-selection)
         ("[tab]" . company-complete-selection)
         :map company-search-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  ;:init
  ;(global-company-mode)
  :hook
  (lisp-interaction-mode . company-mode)
  (c-mode-common . company-mode)
  (python-mode . company-mode)
  (rust-mode . company-mode)
  :config
  (define-key emacs-lisp-mode-map (kbd "C-M-i") nil)
  (global-set-key (kbd "C-M-i") 'company-complete)
  (setq completion-ignore-case t)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence company-sort-by-backend-importance)))

;; flycheck (realtime check)
(use-package flycheck
  :ensure t
  :hook
  ;(after-init . global-flycheck-mode)
  (lisp-interaction-mode . flycheck-mode)
  (c-mode-common . flycheck-mode)
  (python-mode . flycheck-mode)
  (rust-mode . flycheck-mode)
)

;; eglot (language server)
(use-package eglot
  :ensure t
  :hook
  (c-mode-common . eglot-ensure)
  (python-mode . eglot-ensure)
  (rust-mode . eglot-ensure)
  (sh-mode . eglot-ensure)
  (html-mode . eglot-ensure)
  :bind
  (("M-t" . xref-find-definitions)
   ("M-r" . xref-find-references)
   ("C-t" . xref-go-back))
  :config
  (setq eldoc-echo-area-use-multiline-p nil))

;; c/c++
(use-package google-c-style :ensure t)

;; cuda
(use-package cuda-mode
  :ensure t
  :mode ("\\.cu\\'" "\\.cuh\\'"))

;; verilog
(use-package verilog-mode
  :ensure t
  :mode ("\\.v\\'" "\\.vh\\'")
  :config
  (setq
   ;verilog-auto-lineup              '(all)
   verilog-auto-lineup              nil
   verilog-indent-level             2
   verilog-indent-level-module      2
   verilog-indent-level-declaration 2
   verilog-indent-level-behavioral  2
   verilog-indent-level-directive   2
   verilog-case-indent              2
   verilog-minimum-comment-distance 40
   verilog-auto-indent-on-newline   t
   verilog-tab-always-indent        t
   verilog-indent-begin-after-if    t
   verilog-auto-newline             nil
   verilog-auto-endcomments         nil))

;; python
(use-package python
  :ensure t
  :mode ("\\.py'" . python-mode)
  ;:mode ("\\.py'" . python-ts-mode)
  :config
  (setq python-python-command "python3")
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq python-indent 4)
  (setq tab-width 4))

;; ruff-format
(use-package ruff-format
  :ensure t)

(use-package reformatter
  :ensure t
  :hook
  (python-mode-hook . ruff-format-on-save-mode)
  :config
  (reformatter-define ruff-format
                      :program "ruff"
                      :args `("format" "--stdin-filename" ,buffer-file-name "-")))

;; jedi
;(setq jedi:setup-keys t)
;(setq jedi:complete-on-dot t)
;(setq jedi:environment-root ".emacs.d/jedi")
;(setq jedi:environment-virtualenv
;      (append python-environment-virtualenv '("--python" "python3")))
;(define-key jedi-mode-map (kbd "M-TAB") 'jedi:complete)
;(with-eval-after-load 'jedi
;  (setq jedi:server-command
;      (list python-python-command jedi:server-script)))

;; autopep8
;(defun my-python-mode-hook ()
;  ;; autopep8
;  (setq py-autopep8-options '("--ignore=E402" "--max-line-length=100")))
;(add-hook 'python-mode-hook 'my-python-mode-hook)
