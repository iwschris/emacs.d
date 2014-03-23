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
(setq solarized-broken-srgb 'nil)
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
        ("TODO" . org-todo-kwd-face)
        ("STARTED" . org-started-kwd-face)
        ("WAITING" . org-waiting-kwd-face)
        ("SOMEDAY" . org-someday-kwd-face)
        ("DONE" . org-done-kwd-face)
        ))

;; Set Font for all frames -- http://levien.com/type/myfonts/inconsolata.html
(if is-mac
    (add-to-list 'default-frame-alist
                 '(font . "Inconsolata-16"))  ; Mac has higher resolution than my Linux box
    (add-to-list 'default-frame-alist
                 '(font . "Inconsolata-13")))

(provide 'appearance)
