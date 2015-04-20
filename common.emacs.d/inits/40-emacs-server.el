;; Emacs Server Settings
;;(autoload 'server-edit "server" nil t)
;;(server-edit)
;;(if window-system
;;    (setq server-visit-hook
;;          '(lambda () (setq server-window
;;                            (make-frame '((name . "Server frame")(width . 80)(heigth . 40)))))))
;;(if window-system
;;    (setq server-done-hook '(lambda () (kill-buffer buffer))))
;;
;;(if window-system
;;    (global-set-key (kbd "C-x #")
;;                    '(lambda ()
;;                       (interactive)
;;                       (server-edit)
;;                        (if (string-equal "Server frame"
;;                                          (cdr (assq 'name (frame-parameters server-window))))
;;                            (progn (delete-frame server-window)
;;                                   (setq server-window nil))))))
;; start-up emacsclient server
;;(server-start)

