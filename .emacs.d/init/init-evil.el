  (use-package helm
    :ensure t
    :init
     (use-package helm-ag
    :ensure t)
    ) 
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (defun align_by_equals (BEG END)
    "Aligns by ="
    (interactive "r")
    (align-regexp BEG END "="))
  (evil-leader/set-key
    "f" 'helm-ag-this-file
    "F" 'helm-ag
    "b" 'switch-to-next-buffer
    "k" 'kill-this-buffer
    "s" 'sort-lines
    "a" 'align_by_equals)
  (use-package evil
    :ensure t
    :init
    (evil-mode 1)
    (use-package powerline
      :ensure t
      :init
      (use-package powerline-evil
        :ensure t
        :init
        (powerline-evil-vim-color-theme)
        (define-key evil-insert-state-map (kbd "C-e") nil)
        (define-key evil-insert-state-map (kbd "C-n") nil)
        )
      )
    )
  )
(provide 'init-evil)
