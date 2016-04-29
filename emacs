(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-layout)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("mepla-stable" . "http://stable.melpa.org/packages/"))

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
			  'evil
			  'helm
			  'magit
			  'projectile
                          'relative-line-numbers
			  'web-mode)

;; EViL mode
(evil-mode t)
(require 'init-evil)

;; Helm
(require 'init-helm)

;; Theme
(load-theme 'atom-dark t)

;; relative line numbers
(global-relative-line-numbers-mode)

;; auto-mode mappings
(add-to-list 'auto-mode-alist '("emacs$" . emacs-lisp-mode))
