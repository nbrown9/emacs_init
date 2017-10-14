;;;; Nicks .emacs file
;;
;; Updated September 25 2017
;;
;;


;; Modify META key on Mac OS
(if (string-equal system-type "darwin")
    (setq mac-command-modifier 'meta))


;; Add Repos
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; Configure package installer 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Essential Settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message "wolfe")
(tool-bar-mode -1)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(menu-bar-mode -1)
(global-linum-mode t)
(add-to-list 'default-frame-alist '(height . 62))
(add-to-list 'default-frame-alist '(width . 170))
(show-paren-mode t)
(setq initial-scratch-message "")
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)
(delete-selection-mode 1)
(when (member "Menlo" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Menlo-16" ))
  (set-face-attribute 'default t :font "Menlo-16"))

;; Theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t))


;; Org Settings
(setq org-pretty-entities t
      org-src-fontify-natively t
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

;; Better looking org headers
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


;; Smex
(use-package smex
  :config
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))


;; Magit
(use-package magit
  :config
  (global-set-key "\C-x\g" 'magit-status))


;; Spaceline
(use-package spaceline-config
  :ensure spaceline
  :pin melpa-stable
  :config
  (spaceline-emacs-theme))

;; Neotree
(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (global-set-key [f8] 'neotree-toggle))

;; Doom Neotree
(use-package doom-neotree
  :ensure nil
  :config
  (setq doom-neotree-enable-file-icons t))

;; Flycheck
(use-package flycheck
  :config
  (global-flycheck-mode)
  (with-eval-after-load 'flycheck
    (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (exec-path-from-shell zenburn-theme use-package tabbar spaceline smex org-bullets noctilux-theme neotree magit jedi ido-ubiquitous ido-complete-space-or-hyphen iasm-mode flycheck elpy doom-themes dirtree darcula-theme badger-theme atom-one-dark-theme atom-dark-theme ample-zen-theme all-the-icons-ivy all-the-icons-dired ac-php ac-js2 ac-html ac-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
