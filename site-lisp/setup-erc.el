;; Set nicknames to be highlighted
(setq erc-keywords '("ben" "Ben" "beardedprojamz" "everyone" "guys"))

;; Ignore some track stuff
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT"))

;; Set up custom colors
(set-face-attribute 'erc-bold-face nil :foreground (find-color 'yellow))
(set-face-attribute 'erc-button nil :inherit 'link)

(provide 'setup-erc)
