(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq inhibit-startup-message t)

(require 'init-layout)

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(setq backup-directory-alist `(("." . "~/.saves")))

(fringe-mode '(1 . 0))
(setq package-enable-at-startup nil)
(package-initialize)

(defun ensure-package-installed (&rest packages)
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
      nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
        (package-install package)
        package)))
   packages))

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(ensure-package-installed 'avy
                          'base16-theme
                          'clojure-mode
                          'evil
                          'evil-leader
                          'evil-nerd-commenter
                          'helm
                          'helm-projectile
                          'magit
                          'powerline-evil
                          'projectile
                          'relative-line-numbers
                          'use-package
                          'web-mode)

(require 'use-package)

;; EViL mode
(evil-mode t)
(require 'init-evil)

(require 'projectile)
(projectile-global-mode)

;; Helm
(require 'init-helm)

(require 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "C-x C-f") #'helm-projectile)

;; Theme
(load-theme 'base16-twilight-dark)

;; relative line numbers
(global-relative-line-numbers-mode)

;; auto-mode mappings
(add-to-list 'auto-mode-alist '("emacs$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("erb$" . web-mode))

(require 'init-powerline)

(when (memq window-system '(mac ns))
  (setq ns-use-srgb-colorspace nil))

(setq avy-keys (list ?a ?o ?e ?u ?h ?t ?n ?s))

(setq explicit-shell-file-name "/bin/zsh")

(setq make-backup-files nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)


(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq css-indent-offset 2)
(setq scss-indent-offset 2)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq make-backup-files nil)

;; (autoload 'enable-paredit-mode "paredit" "Paredit!" t)

(setq ring-bell-function 'ignore)

(blink-cursor-mode 0)
(show-paren-mode)

(require 'lilypond-init)

;; (require 'haml-mode)
(use-package haml-mode :ensure t)

(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(provide 'init)
