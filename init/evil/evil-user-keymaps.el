;; Clear insert state bindings.
(setcdr evil-insert-state-map nil)

;; Make sure escape gets back to normal state.
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-visual-state-map [escape] 'evil-normal-state)
(define-key evil-emacs-state-map [escape] 'evil-normal-state)

;;;; Misc useful keybindings

;; Jump to file in project
(define-key evil-normal-state-map (kbd ",t") 'textmate-goto-file)

;; Switch to another open buffer
(define-key evil-normal-state-map (kbd ",,") 'switch-to-buffer)

;; Comment or uncomment the current line or marked region
(define-key evil-normal-state-map (kbd ",/") 'comment-or-uncomment-region-or-line)
(define-key evil-visual-state-map (kbd ",/") 'comment-or-uncomment-region-or-line)

;; File tree navigation window
(define-key evil-normal-state-map (kbd ",n") 'nav-toggle)
