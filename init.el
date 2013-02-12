;;;;
;; This is the main config file, It is loaded first, automatically by emacs.
;; It firsts downloads and initializes packages, then loads custom user code
;; and settings.
;;;;



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
                ;; Vim
                evil
                evil-numbers ; Increment and decrement numbers
                evil-surround ; Work with enclosing delimiters like quotes and braces.

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
                ido-hacks ; Make ido perform better

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
                less-css-mode

                ;; Syntax checking
                flymake
                flymake-coffee
                flymake-sass
                flymake-css
                flymake-haml

                ;; Eye candy
                rainbow-delimiters
                pretty-mode
                solarized-theme

                ;; Ruby
                rvm
                flymake-ruby
                inf-ruby
                inf-ruby-bond
                ruby-end
                rspec-mode
                bundler
                ))

(setq el-get-user-package-directory "~/.emacs.d/init")
(el-get 'sync packages)



;; Load misc user settings and functions not realted to a third party package
(load-file "~/.emacs.d/user.el")


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
