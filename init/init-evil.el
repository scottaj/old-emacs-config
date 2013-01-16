(require 'evil)

;; Bar cursor
(setq-default evil-default-cursor 'bar)
(setq-default evil-set-initial-state 'text-mode insert)

;; Remove all insert mode keybindings except ESC
;; This lets you use regular emacs commands in insert mode
(define-key ac-completing-map [escape] 'ac-stop)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-insert-state)
(define-key evil-normal-state-map (kbd "ESC") 'keyboard-quit)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map (kbd "ESC") 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key evil-insert-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-visual-state-map [escape] 'evil-normal-state)

(when (not (display-graphic-p))
  ;;;; NEED TO FIGURE OUT HOW TO FIX THE ARROW KEYS IN THE TERMINAL
  ;;;; AND PUT IT HERE
  (define-key evil-normal-state-map (kbd "<down>") 'evil-next-line)
  )

(evil-mode)