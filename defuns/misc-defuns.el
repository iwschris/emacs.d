;; Misc defuns go here
;; It wouldn't hurt to look for patterns and extract once in a while

;; Add spaces and proper formatting to linum-mode. It uses more room than
;; necessary, but that's not a problem since it's only in use when going to
;; lines.
(setq linum-format (lambda (line)
                     (propertize
                      (format (concat " %"
                                      (number-to-string
                                       (length (number-to-string
                                                (line-number-at-pos (point-max)))))
                                      "d ")
                              line)
                      'face 'linum)))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun today ()
  "Insert string for today's date nicely formatted in American style,
e.g. 09-17-2000."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%m-%d-%Y")))

(defun sign-and-date ()
  "Insert a signature & date. Ex. -- Ben Hayden 09/17/2000."
  (interactive)
  (insert (concat " -- Ben Hayden " (format-time-string "%m-%d-%Y"))))

(defmacro org-set-state (command state)
  "Creates interactive command `command', for setting org mode states."
  (fset command
        `(lambda ()
           (interactive)
           (org-todo ,state))))

(defun chatters ()
  "Start up all communication platforms"
  (interactive)
  (erc-iws 1)
  (jabber-connect-all))
