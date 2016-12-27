;(autoload 'python-mode "python-mode" nil t)
(autoload 'jedi "jedi" nil t)

(add-hook 'python-mode-hook
          '(lambda ()
             ;; python common 
             (setq python-python-command "python3")
             (setq indent-tabs-mode nil)
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)
             ; jedi
             (jedi:setup)
             (setq jedi:setup-keys t)
             (setq jedi:complete-on-dot t)
             (setq jedi:environment-root "jedi")
             (setq jedi:environment-virtualenv
                   (append python-environment-virtualenv '("--python" "python3")))
             (define-key jedi-mode-map (kbd "M-TAB") 'jedi:complete)))

(eval-after-load "jedi"
  '(progn
     (setq jedi:server-command
           (list python-python-command jedi:server-script))))
