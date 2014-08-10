;; Turn off Bell
(setq ring-bell-function 'ignore)

(setq default-tab-width 2)

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
	(set-face-attribute 'default nil :height 240)) ; 180 means 18pt


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
(add-to-list 'auto-mode-alist '("\\.coffee\\.erb$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))


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


;; erc
(require 'erc-nicklist)

;; (erc :server "atlassian.r1dev.com" :port 6667 :nick "ascott")
;; (setq erc-autojoin-channels-alist
			;; '(("r1dev.com" "#desking-dev")))

(defvar growlnotify-command (executable-find "growlnotify") "The path to growlnotify")

(defun growl (title message)
  "Shows a message through the growl notification system using
 `growlnotify-command` as the program."
  (flet ((encfn (s) (encode-coding-string s (keyboard-coding-system))) )
    (let* ((process (start-process "growlnotify" nil
                                   growlnotify-command
                                   (encfn title)
                                   "-a" "Emacs"
                                   "-n" "Emacs")))
      (process-send-string process (encfn message))
      (process-send-string process "\n")
      (process-send-eof process)))
  t)

(defun my-erc-hook (match-type nick message)
  "Shows a growl notification, when user's nick was mentioned. If the buffer is currently not visible, makes it sticky."
  (unless (posix-string-match "^\\** *Users on #" message)
    (growl
     (concat "ERC: name mentioned on: " (buffer-name (current-buffer)))
     message
     )))

(add-hook 'erc-text-matched-hook 'my-erc-hook)
(add-hook 'erc-join-hook 'erc-nicklist)

(eval-after-load 'erc-track
  '(progn
     (defun erc-bar-move-back (n)
       "Moves back n message lines. Ignores wrapping, and server messages."
       (interactive "nHow many lines ? ")
       (re-search-backward "^.*<.*>" nil t n))

     (defun erc-bar-update-overlay ()
       "Update the overlay for current buffer, based on the content of
erc-modified-channels-alist. Should be executed on window change."
       (interactive)
       (let* ((info (assq (current-buffer) erc-modified-channels-alist))
	      (count (cadr info)))
	 (if (and info (> count erc-bar-threshold))
	     (save-excursion
	       (end-of-buffer)
	       (when (erc-bar-move-back count)
		 (let ((inhibit-field-text-motion t))
		   (move-overlay erc-bar-overlay
				 (line-beginning-position)
				 (line-end-position)
				 (current-buffer)))))
	   (delete-overlay erc-bar-overlay))))

     (defvar erc-bar-threshold 1
       "Display bar when there are more than erc-bar-threshold unread messages.")
     (defvar erc-bar-overlay nil
       "Overlay used to set bar")
     (setq erc-bar-overlay (make-overlay 0 0))
     (overlay-put erc-bar-overlay 'face '(:underline "black"))
     ;;put the hook before erc-modified-channels-update
     (defadvice erc-track-mode (after erc-bar-setup-hook
				      (&rest args) activate)
       ;;remove and add, so we know it's in the first place
       (remove-hook 'window-configuration-change-hook 'erc-bar-update-overlay)
       (add-hook 'window-configuration-change-hook 'erc-bar-update-overlay))
     (add-hook 'erc-send-completed-hook (lambda (str)
					  (erc-bar-update-overlay)))))

;; Merlin for ocaml
;; Not an el-get package, requires opam to be setup and for merlin to be installed via
;; opam
(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'merlin)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)

(defun build-and-refresh-ocaml ()
	"Build ocaml project using grunt and then refresh merlin"
	(shell-command "grunt --no-color" "*OCaml Build Output*")
	(merlin-refresh))

(defun ocaml-type-at-point ()
	"Use merlin to show the type of the ocaml expression under the cursor"
	(if merlin-mode;; get current selection or word
			(let (bds p1 p2 inputStr resultStr)

				(if (region-active-p)
					(setq bds (cons (region-beginning) (region-end)))
					(setq bds (bounds-of-thing-at-point 'symbol)))
				(setq p1 (car bds))
				(setq p2 (cdr bds))

				(setq input-str (buffer-substring-no-properties p1 p2))
				(message input-str)
				(message (merlin-type-expr (input-str))))))

(run-with-idle-timer 2
										 :repeat 'ocaml-type-at-point)

(add-hook 'merlin-mode-hook (lambda ()
															(add-hook 'after-save-hook 'build-and-refresh-ocaml t t)))

(global-set-key (kbd "C-=") 'yas-expand)
