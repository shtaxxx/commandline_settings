(when (executable-find "racer")
  (add-hook 'rust-mode-hook '(lambda () (ac-racer-setup)))
  (setq racer-rust-src-path "/usr/local/src/rustc-1.14.0/src"))
