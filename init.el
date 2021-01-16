;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Startup                                                                     ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;

;; Change default directory for e.g. find-file [C-x C-f]
(setq default-directory "C:/Users/Micke")
(push "~/.emacs.d/lisp" load-path)


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; UI settings                                                                 ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;

(add-hook 'emacs-startup-hook 'toggle-frame-maximized)
(setq inhibit-startup-message t)    ; Remove spash screen
(setq visible-bell 1)

(global-hl-line-mode 1)             ; Highlight current line

(scroll-bar-mode -1)                ; Disable visible scrollbar
(menu-bar-mode -1)                  ; Disable menubar
(tool-bar-mode 0)                   ; Disable toolbar
(tooltip-mode -1)                   ; Disable tooltip mode
(set-fringe-mode 10)                ; Make more space on the edges

;; Line/column numbers
(global-display-line-numbers-mode t)
(column-number-mode t)

;; Disable line numers for:
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Transparency settings
(set-frame-parameter (selected-frame) 'alpha '(98 . 90))
(add-to-list 'default-frame-alist '(alpha . (98 . 90)))


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Theme settings                                                              ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;



;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Font settings                                                               ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;

(set-face-attribute 'default nil :font "Hack" )
(set-frame-font "Hack 10" nil t)


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Keybindings                                                                 ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; 'kbd' means keyboard function

;; Rebind C-u
    ;; Default for 'universal-argument' is C-u
    ;; Vim (EvilMode) uses C-u for scrolling
    ;; Rebind 'universal-argument' to C-M-u
(global-set-key (kbd "C-M-u") 'universal-argument)

;; Resize Frames (Windows) 
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Dired settings                                                              ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;

;; Dired: use 'a' to open file and kill dired buffer:
(put 'dired-find-alternate-file 'disabled nil)


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Initialize package sources                                                  ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;

(require 'package)                  ;; Initializes the package system

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents    ;; Refresh the packages descriptions
  (package-refresh-contents))

(setq package-load-list '(all))     ;; List of packages to load

;; 'Use-package' makes it easier to initialize and configurate packages.
;; Source: github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Use Packages                                                                ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;

(require 'use-package)
(setq use-package-always-ensure t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package doom-themes :defer t)
(load-theme 'doom-gruvbox t)
(doom-themes-visual-bell-config)

;; Use Diminish
(use-package diminish)

;; Ivy is a generic completion mechanism for Emacs
;; github.com/abo-abo/swiper
(use-package ivy 
  :diminish
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-f" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill)))

;; Add information to M-x
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; Connect M-x to ivy-rich
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start search with ^

;; Give hints for prefixes
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1.0))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; Org-mode
(unless (package-installed-p 'org)  ;; Make sure the Org package is
  (package-install 'org))           ;; installed, install it if not
(package-initialize)                ;; Initialize & Install Package
;; (setq org-...)                   ;; Your custom settings
(require 'org)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; Add custom bullets in org-mode
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-respect-visual-line-mode t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; Evil-commentary, to comment stuff out
(evil-commentary-mode)
    ;; https://github.com/linktohack/evil-commentary
    ;; [gcc]  comments out a line
    ;; [gc]   comments out selection
    ;; [gcap] comments out a paragraph

;; Evil settings for lots of modes
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Matlab-mode
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Code style                                                                  ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;

(setq c-default-style "linux"
      c-basic-offset 4)

(add-hook 'c-mode-common-hook (lambda ()
				(local-set-key (kbd "RET") 'newline-and-indent)))


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Compiling                                                                   ;;
;;                                                                             ;;
; ; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;

; Compile command
(global-set-key "\C-x\C-m" 'compile)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-collection zenburn-theme which-key use-package shrink-path rainbow-delimiters naysayer-theme matlab-mode json-mode ivy-rich helpful gruvbox-theme evil-commentary doom-themes diminish-buffer diminish darktooth-theme counsel company-anaconda all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
