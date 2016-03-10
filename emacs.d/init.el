; stupid bell...
(setq ring-bell-function 'ignore)

; hide the tool and scroll bars
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

; don't blink the cursor
(blink-cursor-mode 0)

; show matching parens
(show-paren-mode)

; no startup messages
(setq inhibit-splash-screen t
      inhibit-startup-echo-message-area t
      inhibit-startup-message t)

; no #backup files#
(setq make-backup-files nil)

; 2 spaces > 1 tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(setq css-indent-offset 2)
(setq scss-indent-offset 2)

(toggle-frame-maximized)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

; package management
(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(let ((default-directory "~/.emacs.d/site-lisp/"))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path)))
           (normal-top-level-add-subdirs-to-load-path))
         load-path)))

(require 'use-package)


(use-package avy
  :ensure t
  :config
  (progn
    (avy-setup-default)
    (setq avy-keys (list ?a ?o ?e ?u ?s ?n ?t ?h ?i ?d))))

(use-package evil-leader
  :ensure t
  :init (global-evil-leader-mode)
  :config
  (progn
    (defun mikowitz/zoom-win ()
      (if (boundp 'zoom-win-config)
          (progn
            (set-window-configuration zoom-win-config)
            (makunbound 'zoom-win-config))
        (progn
          (setq zoom-win-config (current-window-configuration))
          (delete-other-windows))))

    (evil-leader/set-leader ",")
    (evil-leader/set-key "cc" 'evilnc-comment-or-uncomment-lines)
    (evil-leader/set-key "x" 'helm-M-x)
    (evil-leader/set-key "t" 'helm-projectile-find-file)
    (evil-leader/set-key "ev" (lambda () (interactive) (find-file-other-window "~/projects/dotfiles/emacs.d/init.el")))
    (evil-leader/set-key "z" (lambda () (interactive) (mikowitz/zoom-win)))
    (evil-leader/set-key "b" 'iswitchb-buffer)
    (evil-leader/set-key "m" 'magit-status)
    (evil-leader/set-key "p" 'magit-push-quickly)

    ; avy
    (evil-leader/set-key "w" 'avy-goto-word-0)
    (evil-leader/set-key "g" 'avy-goto-line)
  ))


(use-package evil-nerd-commenter :ensure t)

(use-package evil
  :ensure t
  :init
  (progn
    (custom-set-variables '(evil-shift-width tab-width))

    ; state cursors
    (setq evil-emacs-state-cursor '("gray" box))
    (setq evil-normal-state-cursor '("gray" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("cyan" bar))
    (setq evil-replace-state-cursor '("red" bar))
    (setq evil-operator-state-cursor '("red" hollow))

    ; evil buffer navigation
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

    ; not quite the Abrams method, but close enough...
    (define-key evil-insert-state-map (kbd "C-j") 'evil-normal-state)

    (evil-mode t)))

; relative line numbers!
(use-package relative-line-numbers :ensure t :init
  (progn
    (defface relative-line-numbers-current-line
      '((t :inherit linum :background "black" :foreground "white"))
      "Face for displaying relative line numbers"
      :group 'relative-line-numbers-faces)
    (global-relative-line-numbers-mode)))

(use-package elisp-slime-nav
  :ensure t
  :init
  (progn
    (defun elisp-nav-hook ()
      (elisp-slime-nav-mode)
      (turn-on-eldoc-mode))

    (add-hook 'emacs-lisp-mode-hook 'elisp-nav-hook)

    (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
      'elisp-slime-nav-describe-elisp-thing-at-point)))


(use-package atom-dark-theme
  :ensure t
  :config
  (set-face-attribute font-lock-variable-name-face nil :foreground "#C6C5FE"))

;; (use-package s :ensure t)

(use-package ag :ensure t)

(use-package projectile
  :ensure t
  :init
  (progn
    (projectile-global-mode)
    (setq projectile-completion-system 'helm)
    (setq projectile-enable-caching t)))

(use-package helm :ensure t)
(use-package helm-projectile
  :ensure t
  :init
  (progn
    (setq helm-M-x-fuzzy-match t)
    (setq helm-projectile-fuzzy-match t)))

(add-hook 'find-file-hook (lambda ()
                            (setq default-directory (projectile-project-root))))


(use-package haml-mode :ensure t)
(use-package rspec-mode :ensure t)
(use-package json-mode :ensure t)
(use-package alchemist :ensure t)
(use-package feature-mode :ensure t)
(use-package rust-mode :ensure t)
(use-package toml-mode :ensure t)
(use-package jade-mode :ensure t)
(use-package jsx-mode :ensure t)
(use-package scss-mode :ensure t)
(use-package markdown-preview-mode :ensure t)
(use-package slim-mode :ensure t)
(use-package magit :ensure t)
(use-package web-mode :ensure t)
(use-package yaml-mode :ensure t)
(use-package coffee-mode :ensure t)

(use-package tuareg :ensure t)
(use-package utop :ensure t)
(use-package merlin :ensure t)

(iswitchb-mode 1)

(setq ruby-insert-encoding-magic-comment nil)

(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))
(autoload 'utop-minor-mode "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)

;; -- merlin setup ---------------------------------------

(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'merlin)

;; Enable Merlin for ML buffers
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)

;; So you can do it on a mac, where `C-<up>` and `C-<down>` are used
;; by spaces.
(define-key merlin-mode-map
  (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
(define-key merlin-mode-map
  (kbd "C-c <down>") 'merlin-type-enclosing-go-down)
(set-face-background 'merlin-type-face "#88FF44")

(add-to-list 'load-path "/Users/mberkowitz/.opam/system/share/emacs/site-lisp")
(require 'ocp-indent)
