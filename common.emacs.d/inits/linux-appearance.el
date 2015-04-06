(cond ((eq window-system 'x)
	   (progn 
		 (set-default-font "TakaoGothic-11")
		 (set-fontset-font (frame-parameter nil 'font)
						   'japanese-jisx0208
						   '("TakaoGothic-11" . "unicode-bmp"))
		 (tool-bar-mode nil)
		 (set-scroll-bar-mode'right)
		 (setq initial-frame-alist '((width . 150) (height . 40) (top . 0) (left . 0)))
		 (set-background-color "Black")
		 (set-foreground-color "LightGray")
		 (set-cursor-color "Gray")
		 (set-frame-parameter nil 'alpha 92)
		 (set-face-background 'region "LightSteelBlue1")
		 ;(setq default-frame-alist initial-frame-alist)
		 )))

; Mozc
(when (locate-library "mozc")
  (require 'mozc)
  (setq default-input-method "japanese-mozc")
)
