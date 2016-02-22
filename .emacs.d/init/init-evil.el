(use-package evil-nerd-commenter
  :ensure t
  :config
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-select-search-module 'evil-search-module 'evil-search)
    (evil-leader/set-leader "<SPC>")
    (defun align_by_equals (BEG END)
      "Aligns by ="
      (interactive "r")
      (align-regexp BEG END "="))
    (evil-leader/set-key
      "f" 'ag
      "F" 'ag-project
      "b" 'switch-to-next-buffer
      "x" 'delete-window
      "s" 'sort-lines
      "a" 'align_by_equals
      "cc" 'evilnc-comment-or-uncomment-lines
      "h" 'split-and-move-left
      "j" 'split-and-move-down
      "k" 'split-and-move-up
      "l" 'split-and-move-right
      "gs" 'magit-status)
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
          (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
          (define-key evil-insert-state-map (kbd "C-u") 'evil-scroll-up)
          )
        )
      )
    (define-key evil-normal-state-map (kbd "C-S-P") 'helm-projectile-switch-project)
    (define-key evil-normal-state-map (kbd "C-p")   'helm-projectile)
    (define-key evil-normal-state-map (kbd "C-n") 'evil-ex-nohighlight)
    )
  )
(provide 'init-evil)
