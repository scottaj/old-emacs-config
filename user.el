;; Turn off Bell
(setq ring-bell-function 'ignore)


;; Delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)



;; Comment or uncomment a marked region or your current line if there is no mark set
(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)



;; Make sure option key only acts as Meta on OSX
(setq mac-right-option-modifier 'nil)
(setq mac-option-key-is-meta t)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super) ; sets the Command key as super
(setq ns-command-modifier 'super)



;; Setup handling of backup files.
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 10   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )


;; Font - I like Adobe Source Code Pro (it's free)
(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Source Code Pro")
  (set-face-attribute 'default nil :height 160)) ; 160 means 16pt



;; Switch windows with SHIFT+arrow keys
(windmove-default-keybindings)
(global-set-key (kbd "<select>") 'windmove-up)




;; Match weird files to the appropriate modes
(setq auto-mode-alist  (cons '("Gemfile$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("Gemfile.lock$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("Rakefile$" . ruby-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))


;; Cursor - like a bar, but it can be a block or something
(setq-default cursor-type 'bar)



;; Break a given line at 80 characters or less
(fset 'break-line-near-80
   [?\C-a ?\C-u ?8 ?1 ?\C-f ?\M-b return])
(global-set-key (kbd "C-|") 'break-line-near-80)



;; Shell settings
(when (display-graphic-p)
  (defun set-exec-path-from-shell-PATH ()
    (let ((path-from-shell
           (replace-regexp-in-string "[[:space:]\n]*$" ""
                                     (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
      (setenv "PATH" path-from-shell)
      (setq exec-path (split-string path-from-shell path-separator))))
  (when (equal system-type 'darwin) (set-exec-path-from-shell-PATH)))