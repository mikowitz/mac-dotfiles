(global-set-key (kbd "M-x") #'helm-M-x)

(helm-mode 1)

(setq helm-mode-fuzzy-matching t)
(setq helm-completion-in-region-fuzzy-match t)

(setq helm-M-x-fuzzy-match t)
(setq helm-candidate-number-limit 50)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)

(provide 'init-helm)

