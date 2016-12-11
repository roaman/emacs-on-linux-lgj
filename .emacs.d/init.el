;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(
    ;; Common
    comment-dwim-2			;comment
    ;; setup-faces
    ;; material-theme			;theme
    zenburn-theme			;theme
    
    ;; Python
    better-defaults			;for Python
    flycheck				;for Python
    py-autopep8				;for Python, format as PEP8 when save file
    ;; C/C++
    ;; Java
))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)


;; LOAD CUSTOMIZATION MODULES
;; -------------------------------------

(add-to-list 'load-path "~/.emacs.d/custom/")

;; commom part
(require 'setup-environment)            
(require 'setup-faces)
(require 'setup-local)
(require 'setup-help)


;; (require 'setup-editing)
;; (require 'setup-convenience)
;; (require 'setup-applications)
;; (require 'setup-communication)
;; (require 'setup-data)
;; (require 'setup-text)
;; (require 'setup-programming)
;; (require 'setup-development)
;; (require 'setup-external)
;; (require 'setup-files)

(require 'setup-programming-python)

;; BASIC CUSTOMIZATION
;; --------------------------------------

;; support copy & paste between outside program
(setq x-select-enable-clipboard t)

;; make text mode the default major mode
;; and start auto-fill mode automatically each time you enter Emacs
;; (setq default-major-mode 'text-mode)

;; add-hook 'text-mode-hook  'turn-on-auto-fill) or user refill-mode
;; (add-hook 'text-mode-hook (lambda ( ) (refill-mode 1)))

(global-linum-mode t) ;; enablne line numbers globally


;;;  image for org-mode
; 1. suspend current emacs window
; 2. call scrot to capture the screen and save as a file in $HOME/.emacs.img/
; 3. put the png file reference in current buffer, like this:  [[/home/path/.emacs.img/1q2w3e.png]]

(add-hook 'org-mode-hook 'iimage-mode) ; enable iimage-mode for org-mode

(defun my-screenshot ()
  "Take a screenshot into a unique-named file in the current buffer file
  directory and insert a link to this file."
  (interactive)
  (setq filename
    (concat (make-temp-name
         (concat  (getenv "HOME") "/images/" ) ) ".png"))
  (if (file-accessible-directory-p (concat (file-name-directory (buffer-file-name)) "images/"))
      nil
    (make-directory "images"))
  (suspend-frame)
  (call-process-shell-command "scrot" nil nil nil nil " -s " (concat
                                "\"" filename "\"" ))
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images)
  )
 
;; (global-set-key (kbd "C-p") 'my-screenshot) 
