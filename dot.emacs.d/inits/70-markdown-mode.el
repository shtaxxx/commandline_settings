(autoload 'gfm-mode "markdown-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.markdown" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md" . gfm-mode))

(defun my-gfm-mode-hook ()
  (setq word-wrap nil)
  (visual-line-mode -1)
  (electric-indent-local-mode -1))
(add-hook 'gfm-mode-hook 'my-gfm-mode-hook)
