(setq ring-bell-function 'ignore
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Highlight current line
(global-hl-line-mode 1)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Set Solarized color theme
(require-package 'color-theme-solarized)
(setq solarized-contrast 'high)
(load-theme 'solarized-dark t)

;; Color customizations
(require 'solarized-definitions)
;; Use find-color to find right solarized color
(defun find-color (name)
  (let* ((cells (display-color-cells))
         (index (if window-system
                    (if solarized-degrade
                        3
                      (if solarized-broken-srgb 2 1))
                  (cond ((eq cells 16) 4)
                        ((eq cells 8)  5)
                        (t 3)))))
    (nth index (assoc name solarized-colors))))

;; org-mode colors
(setq org-todo-keyword-faces
      '(
        ("TODO" . font-lock-negation-char-face)
        ("STARTED" . font-lock-type-face)
        ("WAITING" . font-lock-string-face)
        ("SOMEDAY" . font-lock-variable-name-face)
        ("DONE" . font-lock-keyword-face)
        ))

;; Set Font for all frames -- http://levien.com/type/myfonts/inconsolata.html
(if is-mac
    (add-to-list 'default-frame-alist
                 '(font . "Inconsolata-11"))  ; Mac has higher resolution than my Linux box
    (add-to-list 'default-frame-alist
                 '(font . "Inconsolata-13")))

;; Don't let line numbers be italicized or struck through
(require 'linum)
(set-face-attribute 'linum nil :italic nil)
(set-face-attribute 'linum nil :strike-through nil)

(provide 'appearance)
