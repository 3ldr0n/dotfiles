;;; packages.el --- Package configuration file
;;; Commentary:
;;; Emacs Packages configuration --- Package configuration for Emacs
;;;
;;;                   _
;;;  _ __   __ _  ___| | ____ _  __ _  ___  ___
;;; | '_ \ / _` |/ __| |/ / _` |/ _` |/ _ \/ __|
;;; | |_) | (_| | (__|   < (_| | (_| |  __/\__ \
;;; | .__/ \__,_|\___|_|\_\__,_|\__, |\___||___/
;;; |_|                         |___/
;;;
;;; Code:

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package all-the-icons
  :ensure t)

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0)
  (define-key company-active-map (kbd "M-j") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "M-k") 'company-select-previous-or-abort))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package fancy-battery
  :ensure t
  :config
  (fancy-battery-mode))

(use-package latex-preview-pane
  :ensure t
  :init
  (latex-preview-pane-enable))

(use-package telephone-line
  :ensure t
  :init
  (telephone-line-mode 1))

(require 'iso-transl)

(use-package indent-guide
  :ensure t
  :config
  (indent-guide-global-mode))

(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'smex))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook
            (lambda () (org-bullets-mode 1))))

(use-package nov
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents . 5)
                          (bookmarks . 5)
                          (projects . 15)
                          (agenda . 5))))

(use-package sly
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl"))

(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode t))

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package pdf-tools
  :ensure t
  :defer t
  :init
  (pdf-tools-install))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/awesome-tab"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/cql-mode"))

(defun setup-cql-mode()
  (require 'cql-mode)
  (add-to-list 'auto-mode-alist '("\\.cql\\'" . cql-mode)))

(defun setup-awesome-tab()
  (require 'awesome-tab)
  (setq awesome-tab-display-icon t)
  (awesome-tab-mode t))

(load "~/.emacs.d/lisp/custom-modes-config.el")
(load "~/.emacs.d/lisp/clojure-config.el")
(load "~/.emacs.d/lisp/elixir-config.el")
(load "~/.emacs.d/lisp/evil-config.el")
(load "~/.emacs.d/lisp/python-config.el")
(load "~/.emacs.d/lisp/irony-config.el")
(load "~/.emacs.d/lisp/git-config.el")
(load "~/.emacs.d/lisp/project-config.el")

(setup-evil-packages)
(setup-custom-modes-packages)
(setup-clojure-packages)
(setup-elixir-packages)
(setup-python-packages)
(setup-irony-packages)
(setup-git-packages)
(setup-project-packages)
(setup-awesome-tab)
(setup-cql-mode)

;;; packages.el ends here
