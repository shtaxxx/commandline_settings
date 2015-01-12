;; c-mode
(add-hook 'c-mode-common-hook
          '(lambda ()
                                        ;(c-set-style "k&r")
             ))
;; C++
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode))
              auto-mode-alist))

(add-hook 'c++-mode-hook
          '(lambda()
                                        ;(c-set-style "stroustrup")
             (show-paren-mode t)
             (c-set-offset 'innamespace 0)
             (c-set-offset 'arglist-close 0)
             ))
