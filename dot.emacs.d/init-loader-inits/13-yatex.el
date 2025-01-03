(use-package yatex
  :ensure t
  :mode ("\\.tex\\'" . yatex-mode)
  :config
  (setq YaTeX-kanji-code nil)
  (setq YaTeX-use-AMS-LaTeX t)
  ;(setq tex-command "platex --kanji=utf8"
  ;      bibtex-command "pbibtex --kanji=utf8"
  ;      dvi2-command "open -a Preview")
  (defun my-yatex-mode-load-hook ()
    (YaTeX-define-begend-key "ba" "align")
    (setq auto-fill-function nil))
  (add-hook 'yatex-mode-load-hook 'my-yatex-mode-load-hook))
