(autoload 'gtags-mode "gtags" nil t)

(setq gtags-mode-hook
      '(lambda ()
         (local-set-key (kbd "M-t") 'gtags-find-tag)
         (local-set-key (kbd "M-r") 'gtags-find-rtag)
         (local-set-key (kbd "M-s") 'gtags-find-symbol)
         (local-set-key (kbd "C-t") 'gtags-pop-stack)))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
