(setq auto-mode-alist (cons '("\\.v\\'" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.vh\\'" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tb\\'" . verilog-mode) auto-mode-alist))
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))
(setq 
; verilog-auto-lineup              '(all)
 verilog-auto-lineup              nil
 verilog-indent-level             2
 verilog-indent-level-module      2
 verilog-indent-level-declaration 2
 verilog-indent-level-behavioral  2
 verilog-indent-level-directive   2
 verilog-case-indent              2
 verilog-minimum-comment-distance 40
 verilog-auto-indent-on-newline   t
 verilog-tab-always-indent        t
 verilog-indent-begin-after-if    t
 verilog-auto-newline             nil
 verilog-auto-endcomments         nil
 )
