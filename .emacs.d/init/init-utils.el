(defmacro defkbalias (old new)
  `(define-key (current-global-map) ,new
     (lookup-key (current-global-map) ,old)))

;; now "C-x -" equals to "C-x 2"
(defkbalias (kbd "C-x 8'") (kbd "C-8"))
(provide 'init-utils)
