(custom-set-variables '(exec-path-from-shell-check-startup-files nil))
(exec-path-from-shell-initialize)
(let ((envs '("PATH" "GOPATH"))) (exec-path-from-shell-copy-envs envs))
