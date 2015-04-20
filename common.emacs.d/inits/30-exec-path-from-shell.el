(exec-path-from-shell-initialize)

;; General PATH and PATH for golang
(let ((envs '("PATH" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))
