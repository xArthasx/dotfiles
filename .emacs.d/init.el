;;; init.el -- Configuración de emacs

;; Se cambia el direcorio inicial de emacs
(setq default-directory "~/workspace")
;; Iniciar el package-manager
(package-initialize)
;; Establecer la carpeta donde se van a cargar las demás configuraciones
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))
;;; Configuraciones básiscas
;; No hacer backups --- para eso usar git!
(setq make-backup-files nil)
(setq backup-inhebited t)
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
;; Quitar autosave
(setq auto-save-default nil)
;; No mostrar el scrollbar
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
;; Muestra el cursor en ambos parenteis (llave, corchete... etc) cuando se seleciona uno
(show-paren-mode 1)
;; Eliminar mensajes al inicar
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
;; Esconde el menú
(menu-bar-mode -1)
(tool-bar-mode -1)
;; Indicadores
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
;; Muestra el número de donde esta el cursor (horizonal)
(column-number-mode t)
;; Marca como deseado recursivo siempre
(setq dired-recursive-deletes 'always)
;;Cargar configuración de los otros archivos
(require 'init-utils)
(require 'init-elpa)
(require 'init-evil)
(require 'init-powerline)
(require 'init-php)
(require 'init-linum)
(load-theme 'wombat t)
(define-key (current-global-map) (kbd "C-e")
  (lookup-key key-translation-map "\C-x8'"))
(define-key (current-global-map) (kbd "C-n")
  (lookup-key key-translation-map "\C-x8~"))

(use-package magit
  :ensure t)
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
        (setq projectile-enable-caching t)
        (setq projectile-completion-system 'helm)
        (helm-projectile-on)
        )
      )
    )
  )
(use-package wgrep
  :ensure t
  :config
  (setq wgrep-auto-save-buffer t))

(use-package wgrep-ag
  :ensure t
  :commands (wgrep-ag-setup))

(use-package ag
  :ensure t
  :defer t
  :config
  (add-hook 'ag-mode-hook
            (lambda ()
              (wgrep-ag-setup)
              (define-key ag-mode-map (kbd "n") 'evil-search-next)
              (define-key ag-mode-map (kbd "N") 'evil-search-previous)))
  (setq ag-executable "/usr/local/bin/ag")
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t)
  (setq ag-reuse-window t))
(use-package git-gutter
  :ensure t
  :init
  (git-gutter:linum-setup)
  (global-git-gutter-mode +1)
  )
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'"
  :mode "\\.text\\'"
  :mode "\\.markdown\\'")
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")
;; Cambiar a espacios el tabulado
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
