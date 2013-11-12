;; Turn off Bell
(setq ring-bell-function 'ignore)


;; Electric indent
(setq electric-indent-mode t)
(defun disable-electric-indent ()
  (set (make-local-variable 'electric-indent-functions)
       (list (lambda (arg) 'no-indent))))

(add-hook 'coffee-mode-hook 'disable-electric-indent)

;; Auto-scroll compilation buffer
(setq compilation-scroll-output t)

(defun revert-buffer-keep-undo (&rest -)
  "Revert buffer but keep undo history."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (insert-file-contents (buffer-file-name))
    (set-visited-file-modtime (visited-file-modtime))
    (set-buffer-modified-p nil)))

(defun revert-all-buffers ()
    "Refreshes all open buffers from their respective files."
    (interactive)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (revert-buffer-keep-undo)))
    (message "Refreshed open files.") )
(global-set-key (kbd "C-x C-u") 'revert-all-buffers)

;; Cleanup whitespace
(setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace
(global-whitespace-mode t)


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
  (set-face-attribute 'default nil :height 180)) ; 180 means 18pt


;; Vertical ido-prompt
(setq ido-decorations (quote
                       ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation ()
  (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)


;; Switch windows with SHIFT+arrow keys
(windmove-default-keybindings)
(global-set-key (kbd "<select>") 'windmove-up)




;; Match weird files to the appropriate modes
(setq auto-mode-alist  (cons '("Gemfile$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("Gemfile.lock$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("Rakefile$" . ruby-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.apex$" . java-mode))
(add-to-list 'auto-mode-alist '("\\.hamlc$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\.erb$" . coffee-mode))


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

;; Flyspell
(add-hook 'text-mode-hook (lambda () (flyspell-mode t)))


(require 'cl)

(defun hexcolour-luminance (color)
  "Calculate the luminance of a color string (e.g. \"#ffaa00\", \"blue\").
  This is 0.3 red + 0.59 green + 0.11 blue and always between 0 and 255."
  (let* ((values (x-color-values color))
         (r (car values))
         (g (cadr values))
         (b (caddr values)))
    (floor (+ (* .3 r) (* .59 g) (* .11 b)) 256)))

(defun hexcolour-add-to-font-lock ()
  (interactive)
  (font-lock-add-keywords nil
   `((,(concat "#[0-9a-fA-F]\\{3\\}[0-9a-fA-F]\\{3\\}?\\|"
               (regexp-opt (x-defined-colors) 'words))
      (0 (let ((colour (match-string-no-properties 0)))
           (put-text-property
            (match-beginning 0) (match-end 0)
            'face `((:foreground ,(if (> 128.0 (hexcolour-luminance colour))
                                      "white" "black"))
                    (:background ,colour)))))))))

(add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'scss-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'sass-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'less-css-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'sgml-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'nxml-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'haml-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'slim-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'web-mode-hook 'hexcolour-add-to-font-lock)
