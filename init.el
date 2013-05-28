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
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(setq el-get-sources '(
                       (:name exec-path-from-shell
                              :website "http://github.com/purcell/exec-path-from-shell"
                              :description "Fix shell settings in emacs on OSX"
                              :type github
                              :pkgname "purcell/exec-path-from-shell"
                              :features exec-path-from-shell)

                       (:name git-gutter
                              :description "Show git gutter in each buffer"
                              :type github
                              :pkgname "syohex/emacs-git-gutter"
                              :features git-gutter)

                       (:name git-gutter-fringe
                              :description "Show git gutter in each buffer"
                              :type github
                              :pkgname "syohex/emacs-git-gutter-fringe"
                              :features git-gutter-fringe
                              :depends (git-gutter fringe-helper))

                       (:name less-css-mode
                              :type github
                              :pkgname "purcell/less-css-mode"
                              :description "LESS CSS support"
                              :post-init (add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode)))

                       (:name dash-at-point
                              :type github
                              :pkgname "stanaka/dash-at-point"
                              :description "Dash documentation for word under point"
                              :features dash-at-point)

                       (:name ido-hacks
                              :description "Advices for ido-mode."
                              :type github
                              :pkgname "scottjad/ido-hacks"
                              :features ido-hacks)

                       (:name rainbow-delimiters
                              :website "https://github.com/jlr/rainbow-delimiters#readme"
                              :description "Color nested parentheses, brackets, and braces according to their depth."
                              :type github
                              :pkgname "jlr/rainbow-delimiters"
                              :features rainbow-delimiters)

                       (:name pretty-mode
                              :website "https://github.com/scottaj/pretty-symbols"
                              :description "Pretty unicode symbols"
                              :type github
                              :pkgname "scottaj/pretty-symbols"
                              :features pretty-mode)

                       (:name feature-mode
                              :description "Major mode for Cucumber feature files"
                              :type github
                              :pkgname "scottaj/cucumber.el"
                              :features feature-mode
                              :post-init (add-to-list 'auto-mode-alist
                                                      '("\\.feature\\'" . feature-mode)))

                       (:name flymake-easy
                              :type github
                              :pkgname "purcell/flymake-easy"
                              :description "Easy setup for flymake"
                              :website "http://github.com/purcell/flymake-easy")

                       (:name eclim
                              :website "https://github.com/senny/emacs-eclim/"
                              :description "This project brings some of the great eclipse features to emacs developers."
                              :type github
                              :pkgname "senny/emacs-eclim"
                              :features eclim
                              :post-init (progn
                                           (setq eclim-auto-save t)
                                           (global-eclim-mode -1)))

                       (:name scala-mode2
                              :website "https://github.com/hvesalai/scala-mode2"
                              :description "A new scala-mode for Emacs 24"
                              :type github
                              :pkgname "hvesalai/scala-mode2"
                              :load-path "."
                              :features scala-mode2 )

                       (:name ensime
                              :description "ENhanced Scala Interaction Mode for Emacs"
                              :type github
                              :pkgname "aemoncannon/ensime"
                              :build ("sbt update && sbt stage")
                              :depends scala-mode2
                              :features ensime
                              :load-path ("./dist_2.10.0/elisp")
                              :post-init (progn
                                           (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)))
                       
                       (:name web-mode
                              :type github
                              :pkgname "fxbois/web-mode"
                              :features web-mode
                              :post-init (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))
                       ))



;; Install or update these packages on startup if nessesary
(setq packages '(
                exec-path-from-shell ; Make sure correct path gets loaded

                ;; Vim
                evil
                evil-numbers ; Increment and decrement numbers
                evil-surround ; Work with enclosing delimiters like quotes and braces.

                ;; Extra functionality
                textmate ; Common Textmate commands and keybindings.
                magit ; Git plugin
                ;; monky ; Mercurial plugin
                git-gutter-fringe ; Show git status for file on fringe.
                ;; idle-highlight-mode ; Highlight all instances of word under cursor
                smex ; M-x on crack
                fastnav ; fast zapping and marking
                ;; lorem-ipsum ; Generate dummy text
                popup-kill-ring ; Interactively select from kill ring
                undo-tree ; Better undo/redo
                nav ; Tree navigation
                ido-hacks ; Make ido perform better
                ack ; Use ack for searching
                paredit ; Lisp paren editing
                autopair
                dash-at-point ; Dash documentation integration
                ;js2-refactor ; Refactor javascript code

                ;; Completion and templating
                auto-complete
                auto-complete-css
                auto-complete-ruby
                auto-complete-yasnippet
                yasnippet


                ;; Extra language support
                coffee-mode
                web-mode
                yaml-mode
                markdown-mode
                sass-mode
                scss-mode
                js2-mode
                mustache-mode
                haml-mode
                feature-mode
                rhtml-mode
                slim-mode ; Slim, jade, emblem, etc.
                less-css-mode

                ;; Syntax checking
                flymake
                flymake-easy
                flymake-coffee
                flymake-sass
                flymake-css
                flymake-haml

                ;; Eye candy
                rainbow-delimiters
                pretty-mode
                solarized-theme

                ;; Clojure
                ;; clojure-mode
                ;; nrepl
                ;; ac-nrepl

                ;; Scala
                scala-mode2
                ensime

                ;; Java
                eclim

                ;; Ruby
                rvm
                flymake-ruby
                ;; inf-ruby
                ;; inf-ruby-bond
                ruby-end
                rspec-mode
                ;; bundler
                ))

(setq el-get-user-package-directory "~/.emacs.d/init")
(el-get 'sync packages)

;; Load misc user settings and functions not realted to a third party package
(load-file "~/.emacs.d/user.el")


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
