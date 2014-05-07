;;; editing-defuns.el --- Basic text editing defuns -*- lexical-binding: t; -*-
(require 's)

(defun go-up-10-lines ()
  (interactive)
  (previous-line 10))

(defun go-down-10-lines ()
  (interactive)
  (next-line 10))

(defun open-line-and-indent ()
  (interactive)
  (newline-and-indent)
  (end-of-line 0)
  (indent-for-tab-command))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defmacro case-macro (command fxn)
  "Creates interactive command `command', for converting words
to different cases."
  (fset command
        `(lambda ()
           (interactive)
           (mark-word)
           (let* ((beg (region-beginning))
                  (end (region-end))
                  (current-word (buffer-substring-no-properties beg end))
                  (cameled (,fxn current-word)))
             (replace-string current-word cameled nil beg end)))))

(case-macro lower-camel-word s-lower-camel-case)
(case-macro upper-camel-word s-upper-camel-case)
(case-macro snakeify-word s-snake-case)
(case-macro dashify-word s-dashed-words)

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defmacro toggle-breakpoint (command dstr)
  "Creates interactive command `command', for inserting/removing
 a debug line in a buffer."
  (fset command
        `(lambda ()
          (interactive)
          (end-of-line)
          (set-mark (line-beginning-position))
          (let* ((beg (region-beginning))
                 (end (region-end))
                 (current-line (s-trim (buffer-substring-no-properties beg end))))
            (if (equal current-line ,dstr)
                (kill-whole-line)
              (progn (open-line-above)
                     (insert ,dstr)))
            (save-buffer)))))
