(load "autoinsert")
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/template/")
(setq auto-insert-alist
      (append
       '(
         ("\\.c" . "insert.c")
         )
       auto-insert-alist))
