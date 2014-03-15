(setq org-directory "~/Documents/org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-log-done t)
(setq org-agenda-files (list (concat org-directory "/work.org")
                             (concat org-directory "/home.org")))
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-mobile-inbox-for-pull (concat org-directory "/inbox.org"))

(provide 'setup-org)