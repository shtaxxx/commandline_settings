;; python-mode with jedi
(autoload 'python "python" nil t)
(autoload 'jedi "jedi" "Jedi for python" t)

(add-hook 'python-mode-hook
          '(lambda ()
             ;; python common 
             (setq python-python-command "python3")
             (setq indent-tabs-mode nil)
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)
             ;; jedi
             (setq jedi:setup-keys t)
             (jedi:setup)
             (define-key jedi-mode-map (kbd "M-TAB") 'jedi:complete)
             (setq jedi:complete-on-dot t)
             (setq jedi:environment-root "env")
             (setq jedi:environment-virtualenv
                   (append python-environment-virtualenv
                           '("--python" "python3")))))

(eval-after-load "jedi"
  '(progn
     (setq jedi:server-command
           (list python-python-command jedi:server-script))))
