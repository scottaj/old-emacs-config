;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Al's EMACS config
;;
;; Optimized mostly for Ruby editing, with lots of goodies installed.
;;
;; Highlights include:
;;   - Smart auto completion everywhere
;;   - Static code checking for Ruby (highlights errors and warnings)
;;   - Emulation of Textmate's project and file navigation
;;   - Vim emulation
;;
;; ## Useful keybindings ##
;;   C-<anything> = Control-<anything>
;;   M-<anything> = Meta-<anything> (Meta in generally Alt on Windows keyboards and option on Mac keyboards)
;;   s-<anything> = Super-<anything> (Super in generally bound to the windows key on windows keyboards and the command key on Mac keyboards)
;;
;; Most standard keybindings should work as expected, though the functionality they provide may be enhanced by add-ons
;; 
;; Add-ons:
;;   M-X     = Emacs commands for the currently running mode(s)
;;   s-t     = Goto file in project with fuzzy completion
;;   M-s-t   = Refresh list of files in project
;;   s-T     = Goto symbol in current file
;;   s-l     = Goto line number in current file
;;   s-<esc> = Open git status buffer
;;   C-<ret> = Block selection mode
;;   C-c c   = Comment or uncomment your current line or selection
;;   s-z     = Undo
;;   C-z     = Redo
;;
;; Ruby:
;;   C-c C-s = Start a ruby shell in a buffer.
;;   C-c C-l = If you started a ruby shell, load the current file into it.
;;
;; Vim Emulation
;; 

;;;;;;
;; Initialize el-get
;;;;;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/scottaj/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))



;; Install or update these packages on startup if nessesary
(setq packages '(
                ;; Ruby
                Enhanced-Ruby-Mode
                inf-ruby
                inf-ruby-bond
		ruby-end
                rspec-mode
		rvm
                bundler
                
                ;; Completion and templating
		auto-complete
                auto-complete-css
                auto-complete-ruby
                auto-complete-yasnippet
		yasnippet

                ;; Extra language support
		coffee-mode
		yaml-mode
		markdown-mode
                sass-mode
		scss-mode
                json
                mustache-mode
                haml-mode
		feature-mode
                rhtml-mode
		slim-mode              
                
                ;; Eye candy
		rainbow-delimiters		
		color-theme
		pretty-mode

                ;; Vim :\
                evil

                ;; Extra functionality
                textmate ; Common Textmate commands and keybindings.
		wrap-region ; Wrap a selection in a delimiter like quotes or braces
		magit ; Git plugin
                idle-highlight-mode ; Highlight all instances of word under cursor
                dired-single ; reuse same dired buffer when changing directories
		smex ; M-x on crack
		fastnav ; fast zapping and marking
                lorem-ipsum ; Generate dummy text
                popup-kill-ring ; Interactively select from kill ring
                undo-tree ; Better undo/redo
                emacs-nav ; Tree navigation
                exec-path-from-shell ; Fix shell settings in OSX
                evil-numbers ; Increment and decrement numbers
		))


(el-get 'sync packages)



;;;;;;;; Custom settings

;; Turn off Bell
(setq ring-bell-function 'ignore)



;; Turn on right column line numbers
(require 'linum)



;; Comment or uncomment a marked region or your current line if there is no mark set
(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)



;; Make sure option key only acts as Meta on OSX
(setq mac-option-key-is-meta t)


;; Setup handling of backup files.
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )



;; Functions that allow you to manipulate ruby blocks and switch from brace blocks to do..end blocks
(defun ruby-get-containing-block ()
  (let ((pos (point))
        (block nil))
    (save-match-data
      (save-excursion
        (catch 'break
          ;; If in the middle of or at end of do, go back until at start
          (while (and (not (looking-at "do"))
                      (string-equal (word-at-point) "do"))
            (backward-char 1))
          ;; Keep searching for the containing block (i.e. the block that begins
          ;; before our point, and ends after it)
          (while (not block)
            (if (looking-at "do\\|{")
                (let ((start (point)))
                  (ruby-forward-sexp)
                  (if (> (point) pos)
                      (setq block (cons start (point)))
                    (goto-char start))))
            (if (not (search-backward-regexp "do\\|{" (point-min) t))
                (throw 'break nil))))))
        block))

(defun ruby-goto-containing-block-start ()
  (interactive)
  (let ((block (ruby-get-containing-block)))
    (if block
        (goto-char (car block)))))

(defun ruby-flip-containing-block-type ()
  (interactive)
  (save-excursion
    (let ((block (ruby-get-containing-block)))
      (goto-char (car block))
      (save-match-data
        (let ((strings (if (looking-at "do")
                           (cons
                            (if (= 3 (count-lines (car block) (cdr block)))
                                "do\\( *|[^|]+|\\)? *\n *\\(.*?\\) *\n *end"
                              "do\\( *|[^|]+|\\)? *\\(\\(.*\n?\\)+\\) *end")
                            "{\\1 \\2 }")
                         (cons
                          "{\\( *|[^|]+|\\)? *\\(\\(.*\n?\\)+\\) *}"
                          (if (= 1 (count-lines (car block) (cdr block)))
                              "do\\1\n\\2\nend"
                            "do\\1\\2end")))))
          (when (re-search-forward (car strings) (cdr block) t)
            (replace-match (cdr strings) t)
            (delete-trailing-whitespace (match-beginning 0) (match-end 0))
            (indent-region (match-beginning 0) (match-end 0))))))))
(add-hook 'ruby-mode-hook (lambda () (local-set-key (kbd "C-\\") 'ruby-goto-containing-block-start)))
(add-hook 'ruby-mode-hook (lambda () (local-set-key (kbd "C-`") 'ruby-flip-containing-block-type)))



;; Font - I like Adobe Source Code Pro (it's free)
(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Source Code Pro")
  (set-face-attribute 'default nil :height 160))



;; Switch windows with SHIFT+arrow keys
(windmove-default-keybindings)
(global-set-key (kbd "<select>") 'windmove-up)



;;;; Uncomment this to have relative line numbers, you can modify it to have
;;;; *only* relative numbers or relative numbers next to regular numbers.
;; (global-linum-mode t)
;; (setq linum-last-pos 0)

;; (eval-after-load "linum"
;;   '(defun linum-update (buffer)
;;      "Update line numbers for all windows displaying BUFFER."
;;      ;; this is only change but couldn't find better way to do it, tried
;;      ;; linum-before-update-hook but it runs in an excursion so I couldn't get
;;      ;; current line number
;;      (setq linum-last-pos (line-number-at-pos))
;;      (with-current-buffer buffer
;;        (when linum-mode
;;          (setq linum-available linum-overlays)
;;          (setq linum-overlays nil)
;;          (save-excursion
;;            (mapc #'linum-update-window
;;                  (get-buffer-window-list buffer nil 'visible)))
;;          (mapc #'delete-overlay linum-available)
;;          (setq linum-available nil)))))

;; (defface linum-zero
;;   '((t :inherit linum :foreground "grey10" :background "magenta" :weight bold))
;;   "Face for displaying line number 0"
;;   :group 'linum)

;; (defface linum-top
;;   '((t :inherit linum :foreground "grey80" :background "grey30" :weight bold))
;;   "Face for displaying top line number"
;;   :group 'linum)

;; (defface linum-line
;;   '((t :inherit linum :foreground "grey35" :background "grey10" :weight normal))
;;   "Face for displaying absolute line number"
;;   :group 'linum)

;; (defun linum-relativenumber-format (line-number)
;;   (let ((diff (abs (- line-number linum-last-pos))))
;;     (concat
;;      ;(propertize (format "%5d" line-number)
;;       ;                  'face 'linum-line)  ; Uncomment this chunk for absolute line numbers next to the relative ones.
;;             (propertize (format "%3d" diff)
;;                         'face (cond ((zerop diff) 'linum-zero)
;;                                     ((eq 1 line-number) 'linum-top)
;;                                     (t 'linum))))))

;; ;; (setq linum-format 'dynamic)
;; (setq linum-format 'linum-relativenumber-format)



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











;;;; Variables and faces set by emacs through the customize interface, edit them through there!
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((t (:weight extra-bold))))
 '(erm-syn-errline ((t (:box nil :underline "Red"))))
 '(erm-syn-warnline ((t (:box nil :underline "Orange"))))
 '(flymake-errline ((t (:underline "brightred"))))
 '(flymake-warnline ((t (:underline "white"))))
 '(highlight ((t (:inherit nil :background "gray10"))))
 '(hl-line ((t (:background "grey10"))))
 '(idle-highlight ((t (:background "disabledControlTextColor"))) t)
 '(linum ((t (:background "cyan" :foreground "black"))))
 '(mode-line ((t (:background "grey75" :foreground "color-29" :box 1 :height 0.9))))
 '(mode-line-buffer-id ((t (:background "grey65" :foreground "color-20" :weight bold :height 0.9))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "White"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "Red"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "Orange"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "Yellow"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "Green"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "Cyan"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "Blue"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "Purple"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "Magenta"))))
 '(show-paren-match ((t (:background "selectedKnobColor"))))
 '(slim-tab-face ((t (:background "hotpink" :family "\"Source Code Pro\"")))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 1.0)
 '(ac-exuberant-ctags-tag-file-name "TAGS")
 '(ac-modes (quote (emacs-lisp-mode lisp-interaction-mode c-mode cc-mode c++-mode java-mode clojure-mode scala-mode scheme-mode ocaml-mode tuareg-mode perl-mode cperl-mode python-mode ruby-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode slim-mode coffee-mode)))
 '(ac-stop-words (quote ("end" "def" "begin" "do" "it")))
 '(ac-use-fuzzy t)
 '(coffee-tab-width 2)
 '(color-theme-is-cumulative nil)
 '(column-number-mode t)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(cua-normal-cursor-color "black")
 '(cua-rectangle-mark-key [C-return])
 '(cua-remap-control-v nil)
 '(cua-remap-control-z nil)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(el-get-user-package-directory "~/.emacs.d/init")
 '(electric-indent-mode t)
 '(electric-layout-mode t)
 '(electric-pair-mode t)
 '(eol-mnemonic-mac "(Mac)")
 '(fancy-splash-image nil)
 '(flyspell-auto-correct-binding [C-x 9])
 '(global-highlight-changes-mode nil)
 '(global-hl-line-mode nil)
 '(global-linum-mode t)
 '(highlight-changes-visibility-initial-state nil)
 '(ido-mode (quote both) nil (ido))
 '(imenu-auto-rescan t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen nil)
 '(initial-buffer-choice nil)
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(kill-whole-line t)
 '(line-number-mode nil)
 '(mode-require-final-newline nil)
 '(nxml-slash-auto-complete-flag t)
 '(pretty-symbol-patterns (quote ((955 lambda "\\<lambda\\>" (emacs-lisp-mode inferior-lisp-mode lisp-mode clojure-mode python-mode ruby-mode)) (402 lambda "\\<function\\>" (js-mode js2-mode)) (8800 relational "!=" (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode python-mode ruby-mode coffee-mode)) (8800 relational "/=" (emacs-lisp-mode inferior-lisp-mode lisp-mode clojure-mode)) (8805 relational ">=" (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode python-mode ruby-mode coffee-mode emacs-lisp-mode inferior-lisp-mode lisp-mode clojure-mode)) (8804 relational "<=" (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode python-mode ruby-mode coffee-mode emacs-lisp-mode inferior-lisp-mode lisp-mode clojure-mode)) (8743 logical "&&" (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode python-mode ruby-mode coffee-mode)) (8743 logical "\\<and\\>" (emacs-lisp-mode inferior-lisp-mode lisp-mode clojure-mode)) (8744 logical "||" (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode python-mode ruby-mode coffee-mode)) (8744 logical "\\<or\\>" (emacs-lisp-mode inferior-lisp-mode lisp-mode clojure-mode)) (172 logical "\\<not\\>" (emacs-lisp-mode inferior-lisp-mode lisp-mode clojure-mode)))))
 '(require-final-newline nil)
 '(ruby-end-insert-newline nil)
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t))))
 '(save-place-file "~/.emacs.d/places")
 '(scroll-bar-mode nil)
 '(scss-compile-at-save nil)
 '(semantic-mode t)
 '(sentence-end-double-space nil)
 '(shell-file-name "/bin/bash")
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(size-indication-mode t)
 '(standard-indent 2)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(wrap-region-global-mode t)
 '(yas-also-auto-indent-first-line t)
 '(yas-global-mode t nil (yasnippet))
 '(yas-snippet-dirs (quote ("~/.emacs.d/snippets/" "~/.emacs.d/el-get/yasnippet/snippets/")) nil (yasnippet))
 '(yas-wrap-around-region t))



(el-get 'sync packages)

