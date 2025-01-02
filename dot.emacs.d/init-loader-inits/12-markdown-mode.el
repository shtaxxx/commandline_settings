(use-package markdown-mode
  :ensure t
  :commands gfm-mode
  :mode (("\\.markdown" . gfm-mode)
         ("\\.md" . gfm-mode))
  :config
  (setq word-wrap nil)
  (visual-line-mode -1)
  (electric-indent-local-mode -1))
