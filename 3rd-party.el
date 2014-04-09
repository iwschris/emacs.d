;; On the fly syntax checking
(require-package 'flycheck)
(global-flycheck-mode 1)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

;; Auto-complete
(require-package 'auto-complete)
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat user-emacs-directory "ac-dict"))
(require 'auto-complete-config)
(ac-config-default)

;; Git Stuffis
(require-package 'magit)
(require-package 'magit-find-file)

;; Extra Language Modes
(require-package 'coffee-mode)
(require-package 'go-mode)
(require-package 'markdown-mode)
(require-package 'puppet-mode)
(require-package 'jedi)
(require-package 'web-mode)

;; Jabber mode
(require-package 'jabber)
(setq jabber-roster-show-title nil)
(setq jabber-roster-line-format " %c %-25n %u %-8s (%r)")
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

;; Install Multi-term for managing multiple ansi-terms
(require-package 'multi-term)
(setq multi-term-program "/usr/bin/zsh")

;; Snippets package and Load snippets table
(require-package 'yasnippet)
(require 'yasnippet)
(yas-reload-all)

;; Add goto-last-change
(require-package 'goto-last-change)

;; Include The Silver Searcher
(require-package 'ag)

;; Use Autopairing like TextMate
(require-package 'autopair)

(provide '3rd-party)
