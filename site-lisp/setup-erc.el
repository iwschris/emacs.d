;; Set nicknames to be highlighted
(setq erc-keywords '("ben" "Ben" "beardedprojamz" "everyone" "anyone" "guys"))

;; Ignore some track stuff
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT"))

;; Remove control characters that try to make the client beep
(setq erc-interpret-controls-p 'remove)

;; Set up custom colors
(set-face-attribute 'erc-bold-face nil :foreground (find-color 'yellow))

(provide 'setup-erc)
