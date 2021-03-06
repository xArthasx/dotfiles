;;; init.el -- Configuración de emacs
;;; Comentary Configuración de Emacs
;; Se cambia el direcorio inicial de emacs
(setq default-directory "~/workspace")
;; Iniciar el package-manager
(package-initialize)
;; No hacer wrapping en las lineas
(set-default 'truncate-lines t)
;; Establecer la carpeta donde se van a cargar las demás configuraciones
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))
;;; Configuraciones básiscas
;; No hacer backups --- para eso usar git!
(setq make-backup-files nil)
(setq backup-inhebited t)
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
;; Guardar los historial de commands
(savehist-mode 1)
(setq savehist-file "~/.emacs.d/history")
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
(require 'init-projectile)
(require 'init-org)

(load-theme 'wombat t)
(define-key (current-global-map) (kbd "M-e")
  (lookup-key key-translation-map "\C-x8'"))
(define-key (current-global-map) (kbd "M-n")
  (lookup-key key-translation-map "\C-x8~"))

(use-package magit
  :ensure t)
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
  (global-flycheck-mode)
  :config
    )
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")
(use-package editorconfig
  :ensure t
  :init
  (editorconfig-mode 1))
(use-package robe
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'robe-mode)
  :config
  (use-package yasnippet
    :ensure t
    :defer t
    :init
    (yas-global-mode 1)
    :config
    (yas-reload-all)
    (setq tab-always-indent 'complete)
    (setq yas-prompt-functions '(yas-completing-prompt
                                  yas-ido-prompt
                                  yas-dropdown-prompt))
    (define-key yas-minor-mode-map (kbd "<escape>") 'yas-exit-snippet) )
  (use-package company
    :ensure t
    :defer t
    :init
    (global-company-mode)
    :config
    (push 'company-robe company-backends)
    ;; Add yasnippet support for all company backends
    ;; https://github.com/syl20bnr/spacemacs/pull/179
    (defvar company-mode/enable-yas t "Enable yasnippet for all backends.")

    (defun company-mode/backend-with-yas (backend)
      (if (or (not company-mode/enable-yas) (and (listp backend)    (member 'company-yasnippet backend)))
        backend
        (append (if (consp backend) backend (list backend))
          '(:with company-yasnippet))))

    (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
    (setq company-idle-delay 0.1)
    (setq company-selection-wrap-around t)
    (define-key company-active-map [tab] 'company-complete)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous))
  )
(use-package rspec-mode
  :ensure t
  )
(require 'whitespace)
(setq whitespace-style
  (quote
    (face tabs trailing empty)
    )
  )
(global-whitespace-mode)
(use-package indent-guide
  :ensure t
  :init
  (indent-guide-global-mode)
  (setq indent-guide-recursive t))
(use-package rainbow-mode
  :ensure t
  :mode ("\\.css\\'"))
(use-package markdown-mode
  :ensure t
  :mode ("\\.text\\'"
  "\\.markdown\\'"
  "\\.md\\'"))
;; Cambiar a espacios el tabulado
;;""Monaco for Powerline Plus Nerd File Types Plus Font Awesome Plus Octicons Plus Pomicons
(set-default-font "Monaco for Powerline Plus Nerd File Types Plus Font Awesome Plus Octicons Plus Pomicons")
(setq window-system nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-export-backends (quote (ascii html icalendar latex md)))
  '(package-selected-packages
     (quote
       (## web-mode swift-mode rainbow-mode indent-guide rspec-mode company yasnippet robe editorconfig js2-mode flycheck markdown-mode git-gutter ag wgrep-ag wgrep magit helm-projectile projectile grizzl helm php-mode evil-surround powerline-evil powerline evil-leader evil-nerd-commenter org-bullets exec-path-from-shell use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
