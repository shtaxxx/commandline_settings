(cond ((eq window-system 'x)
       (progn
         ;; Fontset
         (create-fontset-from-ascii-font "Monaco" nil "monacoosaka")
         (set-fontset-font "fontset-monacoosaka"
                           'unicode
                           (font-spec :family "Osaka")
                           nil
                           'append)
         (setq face-font-rescale-alist '(("Osaka.*" . 1.2)))
         (add-to-list 'default-frame-alist '(font . "fontset-monacoosaka"))
         ;; Window Size, Color
         ;(set-frame-parameter nil 'fullscreen 'maximized)
         (setq initial-frame-alist '((width . 198) (height . 52) (top . 0) (left . 0)))
         (set-scroll-bar-mode'right)
         (set-background-color "Black")
         (set-foreground-color "LightGray")
         (set-cursor-color "Gray")
         (set-frame-parameter nil 'alpha 90)
         (set-face-background 'region "LightSteelBlue1")
         (tool-bar-mode 0)
         (menu-bar-mode 0)
         )))
