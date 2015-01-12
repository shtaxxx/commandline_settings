;;YaTeX
(setq YaTeX-kanji-code nil)
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(setq load-path (cons "~/.emacs.d/elisp/yatex" load-path))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
                                        ;(setq tex-command "platex --kanji=utf8"
(setq tex-command "dotexshop-utf8"
      bibtex-command "pbibtex --kanji=utf8"
      dvi2-command "open -a Preview")
(setq YaTeX-use-AMS-LaTeX t)
(add-hook 'yatex-mode-load-hook
          (function
           (lambda ()
             (YaTeX-define-begend-key "ba" "align")
             )))
(add-hook 'yatex-mode-hook'(lambda ()(setq auto-fill-function nil)))
