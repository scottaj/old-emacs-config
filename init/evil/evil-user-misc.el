;; Relative line numbers, you can modify it to have
;; *only* relative numbers or relative numbers next to regular numbers.
(global-linum-mode t)
(setq linum-last-pos 0)

(eval-after-load "linum"
  '(defun linum-update (buffer)
     "Update line numbers for all windows displaying BUFFER."
     ;; this is only change but couldn't find better way to do it, tried
     ;; linum-before-update-hook but it runs in an excursion so I couldn't get
     ;; current line number
     (setq linum-last-pos (line-number-at-pos))
     (with-current-buffer buffer
       (when linum-mode
         (setq linum-available linum-overlays)
         (setq linum-overlays nil)
         (save-excursion
           (mapc #'linum-update-window
                 (get-buffer-window-list buffer nil 'visible)))
         (mapc #'delete-overlay linum-available)
         (setq linum-available nil)))))

(defface linum-zero
  '((t :inherit linum :foreground "grey10" :background "magenta" :weight bold))
  "Face for displaying line number 0"
  :group 'linum)

(defface linum-top
  '((t :inherit linum :foreground "grey80" :background "grey30" :weight bold))
  "Face for displaying top line number"
  :group 'linum)

(defface linum-line
  '((t :inherit linum :foreground "grey35" :background "grey10" :weight normal))
  "Face for displaying absolute line number"
  :group 'linum)

(defun linum-relativenumber-format (line-number)
  (let ((diff (abs (- line-number linum-last-pos))))
    (concat
     ;(propertize (format "%5d" line-number)
      ;                  'face 'linum-line)  ; Uncomment this chunk for absolute line numbers next to the relative ones.
            (propertize (format "%3d" diff)
                        'face (cond ((zerop diff) 'linum-zero)
                                    ((eq 1 line-number) 'linum-top)
                                    (t 'linum))))))

;; (add-hook 'evil-insert-state-entry-hook (lambda () (setq linum-format 'dynamic)))
;; (add-hook 'evil-insert-state-exit-hook (lambda () (setq linum-format 'linum-relativenumber-format)))
;; (add-hook 'evil-emacs-state-entry-hook (lambda () (setq linum-format 'dynamic)))
;; (add-hook 'evil-emacs-state-exit-hook (lambda () (setq linum-format 'linum-relativenumber-format)))

;; (setq linum-format 'linum-relativenumber-format)
