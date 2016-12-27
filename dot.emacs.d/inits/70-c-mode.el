(add-to-list 'auto-mode-alist '("\\.h" . c++-mode))

(add-hook 'c-mode-common-hook
          '(lambda()
;             (gtags-mode t)
;             (gtags-make-complete-list)
             ))

(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-offset 'innamespace 0)
             (c-set-offset 'arglist-close 0)))
