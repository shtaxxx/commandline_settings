;; go-mode
;; In advance, install godef, gocode, and goimports in $GOPATH.
;;   go get code.google.com/p/rog-go/exp/cmd/godef
;;   go get -u github.com/nsf/gocode
;;   go get code.google.com/p/go.tools/cmd/goimports
;; exec-path should include a path to .go/bin.
;; So DO NOT launch an emacs from App icon, DO launch an emacs from terminal (shell).

(autoload 'go-mode "go-mode" nil t)
(eval-after-load "go-mode" '(progn (require 'go-autocomplete)))
(add-hook 'go-mode-hook
          '(lambda()
             (setq gofmt-command "goimports")
             (add-hook 'before-save-hook 'gofmt-before-save)
             (setq c-basic-offset 4)
             (setq indent-tabs-mode t)
             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
             (local-set-key (kbd "C-c i") 'go-goto-imports)
             (local-set-key (kbd "C-c d") 'godoc)
             (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)))
