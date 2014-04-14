;; Debugging variables
;;(setq tramp-debug-buffer t)
;;(setq tramp-verbose 10)

;; Be a dumb terminal so zsh turns some stuff off
(setq tramp-terminal-type "dumb")

;; Set up vagrant-tramp
(add-to-list 'exec-path (concat site-lisp-dir "/vagrant-tramp"))
(require 'vagrant-tramp)

(provide 'setup-tramp)
