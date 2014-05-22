;; Module for Mode-specific hooks

;; Run Go fmt on Go files before writing
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'prog-mode-hook
          (lambda()
            (font-lock-add-keywords nil '(
                                          ;; XXX: Highlight important words in comments - ':' is necessary
                                          ("\\<\\(FIXME\\|TODO\\|XXX+\\|BUG\\):" 1 font-lock-warning-face prepend)

                                          ;; Valid hex number (will highlight invalid suffix though)
                                          ("\\b0x[[:xdigit:]]+[uUlL]*\\b" . font-lock-string-face)

                                          ;; Invalid hex number
                                          ("\\b0x\\(\\w\\|\\.\\)+\\b" . font-lock-warning-face)

                                          ;; Valid floating point number.
                                          ("\\(\\b[0-9]+\\|\\)\\(\\.\\)\\([0-9]+\\(e[-]?[0-9]+\\)?\\([lL]?\\|[dD]?[fF]?\\)\\)\\b" (1 font-lock-string-face) (3 font-lock-string-face))

                                          ;; FIXME: Invalid floating point number.  Must be before valid decimal.
                                          ;; ("\\b[0-9].*?\\..+?\\b" . font-lock-warning-face)

                                          ;; Valid decimal number.  Must be before octal regexes otherwise 0 and 0l
                                          ;; will be highlighted as errors.  Will highlight invalid suffix though.
                                          ("\\b\\(\\(0\\|[1-9][0-9]*\\)[uUlL]*\\)\\b" 1 font-lock-string-face)

                                          ;; Valid octal number
                                          ("\\b0[0-7]+[uUlL]*\\b" . font-lock-string-face)

                                          ;; Floating point number with no digits after the period.  This must be
                                          ;; after the invalid numbers, otherwise it will "steal" some invalid
                                          ;; numbers and highlight them as valid.
                                          ("\\b\\([0-9]+\\)\\." (1 font-lock-string-face))

                                          ;; Invalid number.  Must be last so it only highlights anything not
                                          ;; matched above.
                                          ("\\b[0-9]\\(\\w\\|\\.\\)+?\\b" . font-lock-warning-face)
                                          ))
            (wrap-region-mode)
            (yas-minor-mode)
            (if (fboundp 'superword-mode)
                (superword-mode)  ;; Superword is Emacs 24.4 and up...
              (subword-mode))))   ;; settle for subword if superword is missing

;; Since Go uses tabs, at least display them as
;; 4 columns instead of the default 8
(add-hook 'go-mode-hook
          (lambda ()
            (setq-default)
            (setq tab-width 4)
            (setq indent-tabs-mode t)
            (define-key go-mode-map (kbd "s-d") 'godoc)
            (define-key go-mode-map (kbd "s-j") 'godef-jump)
            (define-key go-mode-map (kbd "s-i") 'godef-describe)))

;; Turn Auto-complete on & electric pair off
;; since web-mode has its own
(add-hook 'web-mode-hook
          (function (lambda ()
                      (auto-complete-mode t)
                      (set (make-local-variable 'electric-pair-mode) nil))))

;; Turn electric pair off in ERC
(add-hook 'erc-mode-hook
          (function (lambda ()
                      (set (make-local-variable 'electric-pair-mode) nil)
                      (set-face-attribute 'erc-button nil :inherit 'link))))

;; Turn electric pair off in Jabber
(add-hook 'jabber-chat-mode-hook
          (function (lambda ()
                      (set (make-local-variable 'electric-pair-mode) nil)
                      (set-face-attribute 'jabber-rare-time-face nil :foreground (find-color 'base01)))))

;; Update Indents for Puppet
(add-hook 'puppet-mode-hook
          (function (lambda ()
                      (setq puppet-indent-level 4))))

;; Python mode hooks - Ipython and Breakpoints
(add-hook 'python-mode-hook
          (lambda ()
            ;; Set up IPython interpreter
            (setq
             python-shell-interpreter "ipython"
             python-shell-interpreter-args ""
             python-shell-prompt-regexp "In \\[[0-9]+\\]: "
             python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
             python-shell-completion-setup-code
             "from IPython.core.completerlib import module_completion"
             python-shell-completion-module-string-code
             "';'.join(module_completion('''%s'''))\n"
             python-shell-completion-string-code
             "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
            ;; Define custom commands for inserting
            ;; pdb, pudb & rpdb breakpoints
            (toggle-breakpoint toggle-pdb "import pdb; pdb.set_trace()")
            (toggle-breakpoint toggle-pudb "import pudb; pudb.set_trace()")
            (toggle-breakpoint toggle-rpdb "import rpdb; rpdb.set_trace()")))
(add-hook 'python-mode-hook
          (lambda ()
            ;; Bind the custom commands to keys - can't be done in same
            ;; lambda as the definitions
            (define-key python-mode-map (kbd "M-s M-d") 'toggle-pdb)
            (define-key python-mode-map (kbd "M-s M-u") 'toggle-pudb)
            (define-key python-mode-map (kbd "M-s M-r") 'toggle-rpdb)))
;; Add Jedi setup
(add-hook 'python-mode-hook 'jedi:setup)

;; Javascript mode hooks - Breakpoints
(add-hook 'javascript-mode-hook
          (lambda ()
            ;; Define custom commands for inserting
            ;; debugger; breakpoint
            (toggle-breakpoint toggle-debugger "debugger;")))
(eval-after-load 'js
  ;; JS mode is apparently different, so do it this way
  ;; Bind the custom commands to keys
  '(define-key js-mode-map (kbd "M-s M-d") 'toggle-debugger))

;; Some Multi-Term settings
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)  ;; Set history to a larger value
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (define-key term-raw-map (kbd "C-y") 'term-paste)
            (define-key term-raw-map (kbd "M-v") 'term-paste)
            (define-key term-raw-map (kbd "C-c C-j") 'term-line-mode)
            (define-key term-raw-map (kbd "C-c C-k") 'term-char-mode)
            (define-key term-raw-map (kbd "<M-down-mouse-1>") 'browse-url-at-mouse)))

;; Org-mode specific
(add-hook 'org-mode-hook
          (lambda ()
            (org-set-state org-set-todo "TODO")
            (org-set-state org-set-started "STARTED")
            (org-set-state org-set-waiting "WAITING")
            (org-set-state org-set-someday "SOMEDAY")
            (org-set-state org-set-done "DONE")
            (local-set-key (kbd "H-t") 'org-set-todo)
            (local-set-key (kbd "H-s") 'org-set-started)
            (local-set-key (kbd "H-w") 'org-set-waiting)
            (local-set-key (kbd "H-y") 'org-set-someday)
            (local-set-key (kbd "H-d") 'org-set-done)
            (local-set-key (kbd "H-a") 'org-archive-subtree)))

(provide 'mode-hooks)
