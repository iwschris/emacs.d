;; Change command to meta - more like normal keyboard
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; keybinding to toggle full screen mode
(global-set-key (quote [M-f10]) (quote ns-toggle-fullscreen))

;; Use aspell for spell checking: brew install aspell --lang=en
(setq ispell-program-name "/usr/local/bin/aspell")

;; Set multiterm to brew installed zsh
(setq multi-term-program "/usr/local/bin/zsh")

;; Set up command + c, v for Mac style copy & paste
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "s-v") 'scroll-down-command)
(global-set-key (kbd "M-c") 'ns-copy-including-secondary)
(global-set-key (kbd "s-c") 'capitalize-word)

;; Flip other frame
(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "s-`") 'tmm-menubar)

;; Quit Emacs
(global-set-key (kbd "M-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "s-q") 'fill-paragraph)

(provide 'mac)
