(autoload 'gtags-mode "gtags" nil t)

(defun my-gtags-mode-hook ()
  (local-set-key (kbd "M-t") 'gtags-find-tag)
  (local-set-key (kbd "M-r") 'gtags-find-rtag)
  (local-set-key (kbd "M-s") 'gtags-find-symbol)
  (local-set-key (kbd "C-t") 'gtags-pop-stack))
(setq gtags-mode-hook 'my-gtags-mode-hook)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
