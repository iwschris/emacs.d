;; On the fly syntax checking
(require-package 'flycheck)
(global-flycheck-mode 1)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

;; Git Stuffis
(require-package 'magit)
(require-package 'magit-find-file)

;; Extra Language Modes
(require-package 'coffee-mode)
(require-package 'go-mode)
(require-package 'markdown-mode)
(require-package 'puppet-mode)

;; Jabber mode
(require-package 'jabber)
(setq jabber-account-list '(("hayden767@gmail.com"
                             ;;   (:password . nil)
                             (:network-server . "talk.google.com")
                             (:port . 443)
                             (:connection-type . ssl))
                            ("ben@britecore.com"
                             ;;   (:password . nil)
                             (:network-server . "talk.google.com")
                             (:port . 443)
                             (:connection-type . ssl))))

(provide '3rd-party)
