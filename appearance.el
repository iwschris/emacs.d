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

;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

;; Set Solarized color theme
(require-package 'color-theme-solarized)
(load-theme 'solarized-dark t)
(setq solarized-broken-srgb 'nil)

(provide 'appearance)