(defun air--pop-to-file (file &optional split)
  "Visit a FILE, either in the current window or a SPLIT."
  (if split
      (find-file-other-window file)
    (find-file file)))

(defun move-to-side (side)
  "Move the cursor to the window"
  (if(eq side 'left)
      (windmove-left)
    (if(eq side 'right)
        (windmove-right)
      (if(eq side 'below)
          (windmove-down)
        (if(eq side 'above)
            (windmove-up)
          )
        )
      )
    )
  )
(defun split-and-move (side)
  "Split and move the cursor to the newly created window"
  (interactive)
  (let (err)
    (setq err 0)
    (condition-case case
        (setq err (move-to-side side))
      (error
       (setq err 1)
       )
      )
    (if(eq 1 err)
        (progn (split-window nil nil side nil)
               (move-to-side side))
      )
    )
  )

(defun split-and-move-left ()
  "Split and move the cursor to the newly created window (on the left of current buffer)"
  (interactive)
  (split-and-move 'left)
  )
(defun split-and-move-right ()
  "Split and move the cursor to the newly created window (on the right of current buffer)"
  (interactive)
  (split-and-move 'right)
  )
(defun split-and-move-up ()
  "Split and move the cursor to the newly created window (above of current buffer)"
  (interactive)
  (split-and-move 'above)
  )
(defun split-and-move-down ()
  "Split and move the cursor to the newly created window (below of current buffer)"
  (interactive)
  (split-and-move 'below)
  )
(defun reload-configuration-on-save ()
  (if(string-suffix-p ".el" buffer-file-name)
      (load (buffer-file-name)))
  )
(add-hook 'after-save-hook 'reload-configuration-on-save)
(provide 'init-utils)
