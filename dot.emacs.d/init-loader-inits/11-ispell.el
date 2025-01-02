;; ispell, aspell
(use-package ispell
  :ensure t
  ;:bind "C-c" . ispell-word
  :commands
  (ispell-word
   ispell-region
   ispell-buffer
   ispell-complete-word
   ispell-change-dictionary
   ispell-message)
  :init
  (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+"))
  :config
  ;(defun ispell-tex-buffer-p ()
  ;  (memq major-mode '(plain-tex-mode latex-mode slitex-mode yatex-mode)))
  ;(setq ispell-enable-tex-parser t)
  ; Use Japanese
  (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+"))
  ; Use latex file
  (setq ispell-filter-hook-args '("-w"))
  (defun my-TeX-mode-hook ()
    (setq ispell-filter-hook "detex"))
  (setq TeX-mode-hook 'my-TeX-mode-hook))
