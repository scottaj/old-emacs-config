;; Clear insert state bindings.
(setcdr evil-insert-state-map nil)

;; Don't wait for any other keys after escape is pressed.
(setq evil-esc-delay 0)

;; Make sure escape gets back to normal state and quits things.
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-visual-state-map [escape] 'evil-normal-state)
(define-key evil-emacs-state-map [escape] 'evil-normal-state)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)


;;;; Misc useful keybindings

;; Jump to file in project
;; REQUIRES textmate-mode.el
(define-key evil-normal-state-map (kbd ",t") 'textmate-goto-file)
(define-key evil-normal-state-map (kbd ",T") 'textmate-goto-symbol)
(define-key evil-normal-state-map (kbd ", C-t") 'textmate-clear-cache)
(define-key evil-normal-state-map (kbd ",l") 'goto-line)

;; Git tools
;; REQUIRES Magit
; Open git status buffer
(define-key evil-normal-state-map (kbd ",gs") 'magit-status) ;; git control panel
(define-key evil-normal-state-map (kbd ",gh") 'magit-file-log) ; Commit history for current file
(define-key evil-normal-state-map (kbd ",gb") 'magit-blame-mode) ; Blame for current file
(define-key evil-normal-state-map (kbd ",gg") 'vc-git-grep) ; Git grep


;; Switch to another open buffer
(define-key evil-normal-state-map (kbd ",,") 'switch-to-buffer)

;; Comment or uncomment the current line or marked region
;; REQUIRES CUSTOM DEFINED FUNTION
(define-key evil-normal-state-map (kbd ",/") 'comment-or-uncomment-region-or-line)
(define-key evil-visual-state-map (kbd ",/") 'comment-or-uncomment-region-or-line)

;; File tree navigation window
;; REQUIRES emacs-nav
(define-key evil-normal-state-map (kbd ",n") 'nav-toggle)

;; Prompt for snippet
;; REQUIRES Yasnippet
(define-key evil-normal-state-map (kbd ", SPC") (lambda ()
                                                  (interactive)
                                                  (evil-insert-state)
                                                  (yas-insert-snippet)))

;; Window moving
(define-key evil-normal-state-map (kbd "C-w <left>") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-w <right>") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-w <up>") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-w <down>") 'windmove-down)

;; Find string recursively in files
(define-key evil-normal-state-map (kbd ",f") 'ack)

;; Show undo tree
(define-key evil-normal-state-map (kbd ",u") 'undo-tree)

;; Bind auto completion in insert mode, this clobbers the normal "next line" keybinding
(define-key evil-insert-state-map (kbd "C-n") 'auto-complete)


;; Test runners/helpers
;; RSPEC, requires rspec-mode
(evil-declare-key 'normal ruby-mode-map (kbd ",ss") 'rspec-verify-single)
(evil-declare-key 'normal ruby-mode-map (kbd ",sv") 'rspec-verify)
(evil-declare-key 'normal ruby-mode-map (kbd ",sa") 'rspec-verify-all)
(evil-declare-key 'normal ruby-mode-map (kbd ",st") 'rspec-toggle-example-pendingness)
(evil-declare-key 'normal ruby-mode-map (kbd ",sg") 'rspec-toggle-spec-and-target)
(evil-declare-key 'normal rspec-mode-map (kbd ",ss") 'rspec-verify-single)
(evil-declare-key 'normal rspec-mode-map (kbd ",sv") 'rspec-verify)
(evil-declare-key 'normal rspec-mode-map (kbd ",sa") 'rspec-verify-all)
(evil-declare-key 'normal rspec-mode-map (kbd ",st") 'rspec-toggle-example-pendingness)
(evil-declare-key 'normal rspec-mode-map (kbd ",sg") 'rspec-toggle-spec-and-target)


;; CUCUMBER, requires feature-mode
(evil-declare-key 'normal feature-mode-map (kbd ",sg") 'feature-goto-step-definition)
(evil-declare-key 'normal feature-mode-map (kbd ",ss") 'feature-verify-scenario-at-pos)
(evil-declare-key 'normal feature-mode-map (kbd ",sv") 'feature-verify-all-scenarios-in-buffer)
(evil-declare-key 'normal feature-mode-map (kbd ",sa") 'feature-verify-all-scenarios-in-project)

; Atomic Vim keymap
(evil-declare-key 'normal rspec-mode-map (kbd ",r") 'rspec-verify)
(evil-declare-key 'normal rspec-mode-map (kbd ",R") 'rspec-verify-single)
(evil-declare-key 'normal feature-mode-map (kbd ",R") 'feature-verify-scenario-at-pos)
(evil-declare-key 'normal feature-mode-map (kbd ",r") 'feature-verify-all-scenarios-in-buffer)