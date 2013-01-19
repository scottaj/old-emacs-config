(require 'evil)

;; Bar cursor
(setq-default evil-default-cursor 'bar)
(setq-default evil-set-initial-state 'text-mode insert)

(when (display-graphic-p)
  (setcdr evil-insert-state-map nil))

(define-key evil-insert-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-visual-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-visual-state-map [escape] 'evil-normal-state)

(evil-mode)