(setq auto-mode-alist (cons '("\\.v\\'" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.vh\\'" . verilog-mode) auto-mode-alist))

(setq 
 ;verilog-auto-lineup              '(all)
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

;; flymake
;(add-hook 'verilog-mode-hook (lambda () (flymake-mode t)))
;
;(eval-after-load "flymake"
;  '(progn
;     (defadvice flymake-post-syntax-check 
;         (before flymake-force-check-was-interrupted)
;       (setq flymake-check-was-interrupted t))
;     (ad-activate 'flymake-post-syntax-check)
;
;     (defun flymake-verilog-init ()
;       (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
;              (local (file-relative-name temp (file-name-directory buffer-file-name))))
;         (list "iverilog" (list "-tnull" local))))
;     (add-to-list 'flymake-err-line-patterns
;                  '("\\(.*?\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3))
;     (add-to-list 'flymake-err-line-patterns
;                  '("\\(^No top level modules\\)$" nil nil nil 0))
;     (add-to-list 'flymake-err-line-patterns
;                  '("\\(Unknown module type\\)" nil nil nil 0))
;     (push '("\\.[v]\\'" flymake-verilog-init) flymake-allowed-file-name-masks)))
