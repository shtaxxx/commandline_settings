(add-hook 'rust-mode-hook
          '(lambda ()
             (when (executable-find "racer")
               (setq racer-rust-src-path "/usr/local/src/rustc-1.14.0/src")
               (ac-racer-setup))
             (when (executable-find "rustfmt")
               (rustfmt-enable-on-save))))
