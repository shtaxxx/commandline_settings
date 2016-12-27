(add-hook 'rust-mode-hook '(lambda () (ac-racer-setup)))
(setq racer-cmd (expand-file-name "~/.cargo/bin/racer"))
(setq racer-rust-src-path "/usr/local/src/rustc-1.14.0/src")
