(require 'multiple-cursors)
(global-set-key (kbd "<C-M-return>") 'mc/edit-lines)

(require 'smartrep)
(global-unset-key "\C-o")
(smartrep-define-key
    global-map "C-o" '(("C-n" . 'mc/mark-next-like-this)
                       ("C-p" . 'mc/mark-previous-like-this)
                       ("*"   . 'mc/mark-all-like-this)))
