;; Set web-mode engine overrides - I use Django the most, so default .html with that
(setq web-mode-engines-alist
      '(("django"  . "\\.html\\'")))

;; Set custom indent & padding
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-style-padding 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-script-padding 4)

;; Set some custom face attributes
(set-face-attribute 'web-mode-html-tag-face nil :foreground (find-color 'blue))
(set-face-attribute 'web-mode-doctype-face nil :foreground (find-color 'base01))
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground (find-color 'base1))
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground (find-color 'base2))
(set-face-attribute 'web-mode-html-attr-equal-face nil :foreground (find-color 'base1))

(provide 'setup-web-mode)
