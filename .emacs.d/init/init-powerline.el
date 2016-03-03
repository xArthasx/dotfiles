(require 'evil)
;; Segmento 0
(defface my-pl-segment0-normal-active
  '((t (:background "#AFD700" :foreground "#005F00")))
  "Powerline zero segment active in normal mode")

(defface my-pl-segment0-insert-active
  '((t (:background "#FFFFFF" :foreground "#005F5F")))
  "Powerline zero segment active in normal mode")

(defface my-pl-segment0-visual-active
  '((t (:background "#FFAF00" :foreground "#080808")))
  "Powerline zero segment active in normal mode")

(defface my-pl-segment0-operator-active
  '((t (:background "#00FFFF" :foreground "#FFFFFF")))
  "Powerline zero segment active in normal mode")

(defface my-pl-segment0-replace-active
  '((t (:background "#FF0000" :foreground "#FFFFFF")))
  "Powerline zero segment active in normal mode")

(defface my-pl-segment0-motion-active
  '((t (:background "#FF00FF" :foreground "#FFFFFF")))
  "Powerline zero segment active in normal mode")

(defface my-pl-segment0-emacs-active
  '((t (:background "#EE82EE" :foreground "#FFFFFF")))
  "Powerline zero segment active in normal mode")

;; Segmento 1
(defface my-pl-segment1-normal-active
  '((t (:background "#303030" :foreground "#9E9E9E")))
  "Powerline first segment active in normal mode")

(defface my-pl-segment1-insert-active
  '((t (:background "#0087af" :foreground "#5fafd7")))
  "Powerline first segment active in normal mode")

(defface my-pl-segment1-visual-active
  '((t (:inherit my-pl-segment1-normal-active)))
  "Powerline first segment active in normal mode")

(defface my-pl-segment1-operator-active
  '((t (:inherit my-pl-segment1-normal-active)))
  "Powerline first segment active in normal mode")

(defface my-pl-segment1-replace-active
  '((t (:inherit my-pl-segment1-normal-active)))
  "Powerline first segment active in normal mode")

(defface my-pl-segment1-motion-active
  '((t (:inherit my-pl-segment1-normal-active)))
  "Powerline first segment active in normal mode")

(defface my-pl-segment1-emacs-active
  '((t (:inherit my-pl-segment1-normal-active)))
  "Powerline first segment active in normal mode")

;; Segmento 2
(defface my-pl-segment2-normal-active
  '((t (:background "#202020" :foreground "#4E4E4E")))
  "Powerline second segment active in normal mode")

(defface my-pl-segment2-insert-active
  '((t (:background "#005f87" :foreground "#81D7FF")))
  "Powerline second segment active in normal mode")

(defface my-pl-segment2-visual-active
  '((t (:inherit my-pl-segment2-normal-active)))
  "Powerline second segment active in normal mode")

(defface my-pl-segment2-operator-active
  '((t (:inherit my-pl-segment2-normal-active)))
  "Powerline second segment active in normal mode")

(defface my-pl-segment2-replace-active
  '((t (:inherit my-pl-segment2-normal-active)))
  "Powerline second segment active in normal mode")

(defface my-pl-segment2-motion-active
  '((t (:inherit my-pl-segment2-normal-active)))
  "Powerline second segment active in normal mode")

(defface my-pl-segment2-emacs-active
  '((t (:inherit my-pl-segment2-normal-active)))
  "Powerline second segment active in normal mode")

;; Segmento 3
(defface my-pl-segment3-normal-active
  '((t (:background "#303030" :foreground "#9E9E9E")))
  "Powerline third segment active in normal mode")

(defface my-pl-segment3-insert-active
  '((t (:background "#005f87" :foreground "#81D7FF")))
  "Powerline third segment active in normal mode")

(defface my-pl-segment3-visual-active
  '((t (:inherit my-pl-segment3-normal-active)))
  "Powerline third segment active in normal mode")

(defface my-pl-segment3-operator-active
  '((t (:inherit my-pl-segment3-normal-active)))
  "Powerline third segment active in normal mode")

(defface my-pl-segment3-replace-active
  '((t (:inherit my-pl-segment3-normal-active)))
  "Powerline third segment active in normal mode")

(defface my-pl-segment3-motion-active
  '((t (:inherit my-pl-segment3-normal-active)))
  "Powerline third segment active in normal mode")

(defface my-pl-segment3-emacs-active
  '((t (:inherit my-pl-segment3-normal-active)))
  "Powerline third segment active in normal mode")

(defun my-pl-segment0 ()
  "Function to select appropiate face based on `evil-state'."
  (let* ((face (intern (concat "my-pl-segment0-" (symbol-name evil-state) "-active"))))
    (if (facep face) face nil)))

(defun my-pl-segment1 ()
  "Function to select appropiate face based on `evil-state'."
  (let* ((face (intern (concat "my-pl-segment1-" (symbol-name evil-state) "-active"))))
    (if (facep face) face nil)))

(defun my-pl-segment2 ()
  "Function to select appropiate face based on `evil-state'."
  (let* ((face (intern (concat "my-pl-segment2-" (symbol-name evil-state) "-active"))))
    (if (facep face) face nil)))

(defun my-pl-segment3 ()
  "Function to select appropiate face based on `evil-state'."
  (let* ((face (intern (concat "my-pl-segment3-" (symbol-name evil-state) "-active"))))
    (if (facep face) face nil)))

(defun air--powerline-default-theme ()
  "Set up my custom Powerline with Evil indicators."
  (interactive)
  (setq-default mode-line-format
    '("%e"
       (:eval
         (let* ((active (powerline-selected-window-active))
                 (seg1 (my-pl-segment1))
                 (seg2 (my-pl-segment2))
                 (seg3 (my-pl-segment3))
                 (seg0 (my-pl-segment0))
                 (separator-left (intern (format "powerline-%s-%s"
                                           (powerline-current-separator)
                                           (car powerline-default-separator-dir))))
                 (separator-right (intern (format "powerline-%s-%s"
                                            (powerline-current-separator)
                                            (cdr powerline-default-separator-dir))))
                 (lhs (list
                        ;; Evil indidcator
                        (let ((evil-face seg0))
                          (if evil-mode
                            (powerline-raw (powerline-evil-tag) evil-face)
                            ))
                        ;; Evil separator
                        (if evil-mode
                          (funcall separator-left seg0 seg1))
                        ;;
                        (powerline-buffer-id seg1 'l)
                        (powerline-raw "[%*]" seg1 'l)
                        (when (and (boundp 'which-function-mode) which-function-mode)
                          (powerline-raw which-func-format seg1 'l))
                        (powerline-raw " " seg1)
                        (funcall separator-left seg1 seg2)
                        (when (boundp 'erc-modified-channels-object)
                          (powerline-raw erc-modified-channels-object seg2 'l))
                        (powerline-major-mode seg2 'l)
                        (powerline-process seg2)
                        (powerline-minor-modes seg2 'l)
                        (powerline-narrow seg2 'l)
                        (powerline-raw " " seg2)
                        (funcall separator-left seg2 seg3)
                        (powerline-vc seg3 'r)
                        (when (bound-and-true-p nyan-mode)
                          (powerline-raw (list (nyan-create)) seg3 'l))))
                 (rhs (list (powerline-raw global-mode-string seg0 'r)
                        (funcall separator-right seg3 seg0)
                        (unless window-system
                          (powerline-raw (char-to-string #xe0a1) seg0 'l))
                        (powerline-raw "%4l" seg0 'l)
                        (powerline-raw ":" seg0 'l)
                        (powerline-raw "%3c" seg0 'r)
                        (funcall separator-right seg0 seg0)
                        (powerline-raw " " seg0)
                        (powerline-raw "%6p" seg0 'r)
                        (when powerline-display-hud
                          (powerline-hud seg0 seg0)))))
           (concat (powerline-render lhs)
             (powerline-fill seg3 (powerline-width rhs))
             (powerline-render rhs)))))))

(use-package powerline
  :ensure t
  :config
  (setq powerline-default-separator (if (display-graphic-p) 'slant
                                      nil))
  (air--powerline-default-theme))

(use-package powerline-evil
  :ensure t)
(setq powerline-default-separator "arrow")
(provide 'init-powerline)
