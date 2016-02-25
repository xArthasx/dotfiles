(use-package helm
  :ensure t
  :config
  (use-package grizzl
    :ensure t
    :config
    (use-package projectile
      :ensure t
      :defer t
      :config
      (projectile-global-mode)
      :init
      (use-package helm-projectile
        :ensure t
        :commands (helm-projectile helm-projectile-switch-project)
        :init
        (setq projectile-completion-system 'helm)
        (helm-projectile-on)
        (setq projectile-switch-project-action 'helm-projectile)
        (defvar helm-source-file-not-found
          (helm-build-dummy-source
            "Create file"
            :action 'find-file))
        (add-to-list 'helm-projectile-sources-list helm-source-file-not-found t)
        (setq projectile-enable-caching nil)
        )
      )
    )
  )
(provide 'init-projectile)