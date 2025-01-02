;; Set hostname
;(setq hostname (system-name))

;; Fontset
(create-fontset-from-ascii-font "Monaco-14:weight=normal:slant=normal" nil "monacoosaka")
;(create-fontset-from-ascii-font "Monaco" nil "monacoosaka")
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
(set-background-color "Black")
(set-foreground-color "LightGray")
(set-cursor-color "Gray")
(set-frame-parameter nil 'alpha 90)
(set-face-background 'region "LightSteelBlue1")

;; Do not open a new window
(setq ns-pop-up-frames nil)

;; No tool-bar and menu-bar
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Meta/Super key
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;; Full Screen
(global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)

;; Wheel mouse
(defun down-slightly () (interactive) (scroll-down 5))
(defun up-slightly   () (interactive) (scroll-up   5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly  )
(defun down-one () (interactive) (scroll-down 1))
(defun up-one   () (interactive) (scroll-up   1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one  )
(defun down-a-lot () (interactive) (scroll-down))
(defun up-a-lot   () (interactive) (scroll-up  ))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot  )

;; Input method
;(mac-add-key-passed-to-system 'shift)
;(setq default-input-method "MacOSX")
