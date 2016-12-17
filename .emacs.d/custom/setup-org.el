;; Enable image support
;; -------------------------------
;;;  image for org-mode
; 1. suspend current emacs window
; 2. call scrot to capture the screen and save as a file in $HOME/.emacs.img/
; 3. put the png file reference in current buffer, like this:  [[/home/path/.emacs.img/1q2w3e.png]]

; C-c C-x C-v org-toggle-inline-images
(add-hook 'org-mode-hook 'iimage-mode) ; enable iimage-mode for org-mode

(defun my-screenshot ()
  "Take a screenshot into a unique-named file in the current buffer file
  directory and insert a link to this file."
  (interactive)
  (if (file-accessible-directory-p (concat (file-name-directory (buffer-file-name)) "images/"))
      nil
    (make-directory "images"))
  (setq filename
        (concat (make-temp-name
                 (concat  (file-name-directory (buffer-file-name))  "/images/" )) ".png"))
;;  (suspend-frame)
  (call-process-shell-command "scrot" nil nil nil nil " -s " (concat "\"" filename "\"" ))
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images)
 )

(global-set-key (kbd "C-C p") 'my-screenshot)

(provide 'setup-org)

