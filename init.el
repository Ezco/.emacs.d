(package-initialize)

(when (>= emacs-major-version 26)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; Org-mode configuration
;; -*- emacs-lisp -*-
(unless package-archive-contents    ;; Refresh the packages descriptions
  (package-refresh-contents))
(setq package-load-list '(all))     ;; List of packages to load
(unless (package-installed-p 'org)  ;; Make sure the Org package is
  (package-install 'org))           ;; installed, install it if not
(package-initialize)                ;; Initialize & Install Package
;; (setq org-...)                   ;; Your custom settings
(require 'org)

;; UI settings
:: (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'vscode-dark-plus t)
;; (load-theme 'gruvbox-dark-medium-theme.el t)
(setq inhibit-startup-screen t)
(setq visible-bell 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
  
;; Transparancy settings
;; (set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;; (set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(95 . 80))
(add-to-list 'default-frame-alist '(alpha . (95 . 80)))

(set-face-attribute 'default nil :font "Hack" )
(set-frame-font "Hack 10" nil t)

;; Evil-mode configuration
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

;; KEYBINDINGS
;;
;; Window resize
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Dired: use 'a' to open file and kill dired buffer.
(put 'dired-find-alternate-file 'disabled nil)

;; evil-commentary, to comment stuff out
(evil-commentary-mode)

;; Code style
;; (setq c-default-style "linux"
;;       c-basic-offset 4)

;; Compile command
(global-set-key "\C-x\C-m" 'compile)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#ebdbb2" "#cc241d" "#98971a" "#d79921" "#458588" "#b16286" "#689d6a" "#3c3836"])
 '(c-default-style (quote ((c-mode . "linux") (c++-mode . "linux"))))
 '(custom-enabled-themes (quote (gruvbox-dark-hard)))
 '(custom-safe-themes
   (quote
    ("367bd7bcfd2d11116820be82c71c97159ec58d82a3c5262288ce3a336595eeeb" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" default)))
 '(package-selected-packages
   (quote
    (gruvbox-theme json-mode evil-commentary autothemer)))
 '(pdf-view-midnight-colors (quote ("#282828" . "#f9f5d7"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
