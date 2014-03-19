;; Perform general cleanup.
(global-set-key (kbd "C-c w") 'toggle-show-trailing-whitespace)
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-c C-n") 'cleanup-buffer)

;; Redirect back to minibuffer
(global-set-key (kbd "<f2>") 'switch-to-minibuffer-window)

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

;; Change next underscore with a camel case
(global-set-key (kbd "C-c C--") 'replace-next-underscore-with-camel)
(global-set-key (kbd "M-s M--") 'snakeify-current-word)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; Window switching
(global-set-key (kbd "C-c r") 'rotate-windows)

;; Navigation bindings
(global-set-key (kbd "<prior>") 'beginning-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<next>") 'end-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c ,") 'toggle-comment-on-line)

;; Eval buffer
(global-set-key (kbd "C-c C-k") 'eval-buffer)

;; Clever newlines
(global-set-key (kbd "C-o") 'open-line-and-indent)
(global-set-key (kbd "C-c C-b") 'open-line-below)
(global-set-key (kbd "C-c C-a") 'open-line-above)

;; Copy|Delete Lines
(global-set-key (kbd "C-c k") 'copy-line)
(global-set-key (kbd "C-c d") 'kill-whole-line)

;; Find files by name and display results in dired
(global-set-key (kbd "M-s f") 'find-name-dired)

;; Org bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "<f3>") 'org-mobile-pull)
(global-set-key (kbd "<f4>") 'org-mobile-push)

;; Hippie Expand
(global-set-key (kbd "C-c e") 'hippie-expand)

;; Magit bindings
(global-set-key (kbd "C-c p") 'magit-find-file-completing-read)

;; Refresh Syntax Highlighting
(global-set-key (kbd "C-c C-f") 'font-lock-fontify-buffer)

(provide 'key-bindings)
