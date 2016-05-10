(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-layout)

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

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

(ensure-package-installed 'atom-dark-theme
                          'avy
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
(load-theme 'atom-dark t)

;; relative line numbers
(global-relative-line-numbers-mode)

;; auto-mode mappings
(add-to-list 'auto-mode-alist '("emacs$" . emacs-lisp-mode))

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
;; (add-hook 'clojure-mode-hook #'enable-parinfer-mode)

(setq ring-bell-function 'ignore)
(blink-cursor-mode 0)
(show-paren-mode)

(require 'lilypond-init)
(require 'parinfer-mode)

;; Set Speclj indentaion
(put 'describe 'clojure-backtracking-indent '(4 2))
(put 'it 'clojure-backtracking-indent '(4 2))
(put 'before 'clojure-backtracking-indent '(2))
(put 'before-all 'clojure-backtracking-indent '(2))
(put 'after-all 'clojure-backtracking-indent '(2))
(put 'after 'clojure-backtracking-indent '(2))

;; (require 'haml-mode)
(use-package haml-mode :ensure t)

(provide 'init)
