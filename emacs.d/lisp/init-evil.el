(require 'evil-leader)
(require 'evil-nerd-commenter)

;; navigation
(global-set-key (kbd "C-l") #'evil-window-right)
(global-set-key (kbd "C-h") #'evil-window-left)
(global-set-key (kbd "C-k") #'evil-window-up)
(global-set-key (kbd "C-j") #'evil-window-down)

(global-evil-leader-mode)

(evil-leader/set-leader ",")
(evil-leader/set-key
 "t" #'helm-projectile
 "b" 'helm-mini
 "cc" 'evilnc-comment-or-uncomment-lines
 "w" 'avy-goto-word-0
 "l" 'avy-goto-line
 "m" 'magit-status
 "ir" 'magit-rebase-interactive
)

(provide 'init-evil)
