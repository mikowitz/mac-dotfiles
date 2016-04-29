;; navigation
(global-set-key (kbd "C-l") #'evil-window-right)
(global-set-key (kbd "C-h") #'evil-window-left)
(global-set-key (kbd "C-k") #'evil-window-up)
(global-set-key (kbd "C-j") #'evil-window-down)

(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader ",")
(evil-leader/set-key
 "t" #'helm-projectile
 "b" 'helm-mini
)

(provide 'init-evil)
