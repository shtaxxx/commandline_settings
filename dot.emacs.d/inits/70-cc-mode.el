(autoload 'google-c-style "google-c-style" nil t)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'c-mode-common-hook
          '(lambda()
             (require 'auto-complete-clang-async)
             (setq ac-clang-complete-executable "clang-complete")
             (setq ac-sources '(ac-source-clang-async))
             (ac-clang-launch-completion-process)))
          
;(add-hook 'c-mode-common-hook
;          '(lambda()
;             (gtags-mode t)
;             (gtags-make-complete-list)))
