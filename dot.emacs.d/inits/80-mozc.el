; Mozc
(when (locate-library "mozc")
  (require 'mozc)
  (setq default-input-method "japanese-mozc"))
