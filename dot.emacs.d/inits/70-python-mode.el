(defun my-python-mode-hook ()
  ;; python common 
  (setq python-python-command "python3")
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq python-indent 4)
  (setq tab-width 4)
  ;; jedi
  (jedi:setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  (setq jedi:environment-root "jedi")
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv '("--python" "python3")))
  (define-key jedi-mode-map (kbd "M-TAB") 'jedi:complete)
  ;; py-autopep8
  (setq py-autopep8-options '("--ignore=E402" "--max-line-length=100")))
(add-hook 'python-mode-hook 'my-python-mode-hook)

(with-eval-after-load 'jedi
  (setq jedi:server-command
        (list python-python-command jedi:server-script)))
