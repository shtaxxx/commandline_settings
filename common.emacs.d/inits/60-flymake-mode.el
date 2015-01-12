;; flymake-mode
(autoload 'flymake-mode "flymake" "flymake-mode for automatic syntax check" t)
;; flymake-mode for Verilog HDL
;(add-hook 'verilog-mode-hook (lambda () (flymake-mode 1)))

;; flymake settings
(eval-after-load "flymake"
  '(progn
     (defadvice flymake-post-syntax-check 
       (before flymake-force-check-was-interrupted)
       (setq flymake-check-was-interrupted t))
     (ad-activate 'flymake-post-syntax-check)
     ;; Verilog HDL
     (defun flymake-verilog-init ()
       (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
              (local (file-relative-name temp (file-name-directory buffer-file-name))))
         (list "iverilog" (list "-tnull" local))))
     (add-to-list 'flymake-err-line-patterns
                  '("\\(.*?\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3))
     (add-to-list 'flymake-err-line-patterns
                  '("\\(^No top level modules\\)$" nil nil nil 0))
     (add-to-list 'flymake-err-line-patterns
                  '("\\(Unknown module type\\)" nil nil nil 0))
     (push '("\\.[v]\\'" flymake-verilog-init) flymake-allowed-file-name-masks)))
