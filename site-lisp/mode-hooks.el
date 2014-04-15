;; Module for Mode-specific hooks

;; XXX: Highlights some important keywords - the ':' is important
(add-hook 'prog-mode-hook
          (lambda()
            (font-lock-add-keywords nil
                                    '(("\\<\\(FIXME\\|TODO\\|XXX+\\|BUG\\):"
                                       1 font-lock-warning-face prepend)))
            (yas-minor-mode)
            (superword-mode)))

;; Since Go uses tabs, at least display them as
;; 4 columns instead of the default 8
(add-hook 'go-mode-hook
          (lambda ()
            (setq-default)
            (setq tab-width 4)
            (setq indent-tabs-mode t)))

;; Turn Auto-complete on & autopair off
;; since web-mode has its own
(add-hook 'web-mode-hook
          (function (lambda ()
                      (auto-complete-mode t)
                      (autopair-mode -1))))

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
            (define-key term-raw-map (kbd "C-c C-j") 'term-line-mode)
            (define-key term-raw-map (kbd "C-c C-k") 'term-char-mode)))

(provide 'mode-hooks)
