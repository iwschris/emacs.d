;; Module for Mode-specific hooks

;; Since Go uses tabs, at least display them as
;; 4 columns instead of the default 8
(add-hook 'go-mode-hook
          (lambda ()
            (setq-default)
            (setq tab-width 4)
            (setq indent-tabs-mode t)))

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
            ;; pudb & rpdb breakpoints
            (toggle-breakpoint toggle-pudb "import pudb; pudb.set_trace()")
            (toggle-breakpoint toggle-rpdb "import rpdb; rpdb.set_trace()")))
(add-hook 'python-mode-hook
          (lambda ()
            ;; Bind the custom commands to keys - can't be done in same
            ;; lambda as the definitions
            (define-key python-mode-map (kbd "M-s M-d") 'toggle-pudb)
            (define-key python-mode-map (kbd "M-s M-r") 'toggle-rpdb)))

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

(provide 'mode-hooks)
