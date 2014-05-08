;;; key-bindings.el --- Defines custom key bindings

;;; Commentary:
;;
;; This is where you define custom key bindings

;;; Code:

;; New List buffers - ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Perform general cleanup.
(global-set-key (kbd "C-c w") 'toggle-show-trailing-whitespace)
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Redirect back to minibuffer
(global-set-key (kbd "<f2>") 'switch-to-minibuffer-window)

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

;; Change next underscore with a camel case - ExampleWord
(global-set-key (kbd "M-s c l") 'lower-camel-word)
(global-set-key (kbd "M-s c u") 'upper-camel-word)
(global-set-key (kbd "M-s c s") 'snakeify-word)
(global-set-key (kbd "M-s c d") 'dashify-word)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; Toggle two most recent buffers
(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "s-b") 'quick-switch-buffer)

;; Hide buffer
(global-set-key (kbd "s-y") 'bury-buffer)

;; Window switching
(global-set-key (kbd "C-c r") 'rotate-windows)

;; Navigation bindings
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; Go up & down 10 lines
(global-set-key (kbd "M-<up>") 'go-up-10-lines)
(global-set-key (kbd "M-<down>") 'go-down-10-lines)

;; Goto last change
(global-set-key (kbd "C-x C-/") 'goto-last-change)

;; Create new Frame, vert / horiz windows
(global-set-key (kbd "<f7>") 'split-window-below)
(global-set-key (kbd "<f8>") 'split-window-right)
(global-set-key (kbd "<f9>") 'make-frame)

;; Delete window & other windows (quicker)
(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-1") 'delete-other-windows)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c C-,") 'toggle-comment-on-line)

;; Eval buffer
(global-set-key (kbd "C-c C-k") 'eval-buffer)

;; Clever newlines
(global-set-key (kbd "C-o") 'open-line-and-indent)
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

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
(global-set-key (kbd "s-/") 'hippie-expand)

;; Sr. Speedbar Shortcut
(global-set-key (kbd "M-s M-b") 'sr-speedbar-toggle)

;; Sign & Date
(global-set-key (kbd "C-c s") 'sign-and-date)

;; Magit Keys
(global-set-key (kbd "M-g M-d") 'magit-diff-unstaged)
(global-set-key (kbd "M-g M-s") 'magit-status)
(global-set-key (kbd "M-g M-b") 'magit-branch-manager)
(global-set-key (kbd "M-g M-a") 'magit-stage-all)
(global-set-key (kbd "M-g M-c") 'magit-commit)
(global-set-key (kbd "M-g C-M-c") 'magit-commit-amend)
(global-set-key (kbd "M-g M-p") 'magit-push)
(global-set-key (kbd "M-g M-l") 'magit-pull)
(global-set-key (kbd "M-g M-r") 'magit-rebase-step)
(global-set-key (kbd "M-g M-m") 'magit-blame-mode)

;; Multi Term Shortcuts
(global-set-key (kbd "C-c t") 'multi-term)

;; Run Silver Searcher
(global-set-key (kbd "M-s M-s") 'ag)
(global-set-key (kbd "M-s C-d") 'ag-dired)

;; Flip other frame
(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "s-`") 'tmm-menubar)

;; Toggle Through Buffers
(global-set-key (kbd "M-}") 'next-buffer)
(global-set-key (kbd "M-{") 'previous-buffer)

;; Remap M-x to H-x
(global-set-key (kbd "H-x") 'execute-extended-command)

;; Remap copy, cut, paste
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)

;; Traditional save
(global-set-key (kbd "M-s") 'save-buffer)

;; Traditional quit
(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)

;; Traditional open
(global-set-key (kbd "M-o") 'ido-find-file)

;; Remap kill buffer
(global-set-key (kbd "M-w") 'ido-kill-buffer)

;; HYPER ZONE!

;; Open bookmark list
(global-set-key (kbd "H-b") 'bookmark-bmenu-list)

;; Run Calc
(global-set-key (kbd "H-c") 'calc)

;; List all Flycheck errors
(global-set-key (kbd "H-e") 'flycheck-list-errors)
;; Run Flycheck
(global-set-key (kbd "H-f") 'flycheck-buffer)

;; Kill & Delete shortcut (shorter than C-x 4 0)
(global-set-key (kbd "H-k") 'kill-buffer-and-window)

;; Go to line
(global-set-key (kbd "H-l") 'goto-line)

;; Replace string
(global-set-key (kbd "H-r") 'replace-string)

;; Toggle Whitspace Mode
(global-set-key (kbd "H-w") 'whitespace-mode)

;; Hyper file mappings
(global-set-key (kbd "H-f t") (lambda() (interactive)(find-file "~/Google Drive/org/tasks.org")))
(global-set-key (kbd "H-f k") (lambda() (interactive)(find-file "~/.emacs.d/site-lisp/key-bindings.el")))

(provide 'key-bindings)
