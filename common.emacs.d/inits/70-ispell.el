;; ispell, aspell
;(global-set-key (kbd "C-c") 'ispell-word)

(setq hostname (system-name))
(setq ispell-program-name "aspell")
(autoload 'ispell-word "ispell" "Check the spelling of word in buffer." t)
(autoload 'ispell-region "ispell" "Check the spelling of region." t)
(autoload 'ispell-buffer "ispell" "Check the spelling of buffer." t)
(autoload 'ispell-complete-word "ispell" "Look up current word in dictionary and try to complete it." t)
(autoload 'ispell-change-dictionary "ispell" "Change ispell dictionary." t)
(autoload 'ispell-message "ispell" "Check spelling of mail message or newsx post.")
;(defun ispell-tex-buffer-p ()
; (memq major-mode '(plain-tex-mode latex-mode slitex-mode yatex-mode)))
;(setq ispell-enable-tex-parser t)

;; Use Japanese
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
;; Use latex file
(setq ispell-filter-hook-args '("-w"))
(setq TeX-mode-hook
      (function
       (lambda ()
         (setq ispell-filter-hook "detex"))))
