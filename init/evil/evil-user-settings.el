;; Change cursor in different modes.
(setq evil-default-cursor 'bar)
(setq evil-normal-state-cursor 'box)
(setq evil-visual-state-cursor 'hollow)
(setq evil-replace-state-cursor 'box)

;; Replace uses global option by default
(setq evil-ex-substitute-global t)

;; Set the initial evil state that certain major modes will be in.
(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)
(evil-set-initial-state 'ensime-search-mode 'emacs)
(evil-set-initial-state 'fundamental-mode 'emacs)
(evil-set-initial-state 'special-mode 'emacs)
(evil-set-initial-state 'eclim-problems-mode 'emacs)
