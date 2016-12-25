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
    magit                               ;for git
))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)


;; LOAD CUSTOMIZATION MODULES
;; -------------------------------------

(add-to-list 'load-path "~/.emacs.d/custom/")

;; commom part
(require 'setup-org)			
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit comment-dwim-2 zenburn-theme py-autopep8 material-theme flycheck elpy better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
