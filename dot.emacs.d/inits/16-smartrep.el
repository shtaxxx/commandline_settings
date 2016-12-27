(require 'smartrep)
(global-unset-key "\C-o")
(smartrep-define-key
    global-map "C-o" '(("C-n" . 'mc/mark-next-like-this)
                       ("C-p" . 'mc/mark-previous-like-this)
                       ("*"   . 'mc/mark-all-like-this)))
