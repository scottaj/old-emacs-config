;; Clear insert state bindings.
(setcdr evil-insert-state-map nil)

; Don't wait for any other keys after escape is pressed.
(setq evil-esc-delay 0)

;; Make sure escape gets back to normal state and quits things.
(global-set-key [escape] 'keyboard-quit)
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


;; Make C-e work in normal and visual mode
(define-key evil-visual-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)


;;;; Misc useful keybindings

;; Open file
(define-key evil-normal-state-map (kbd ",e") 'helm-find-files)

;; ;; Jump to file in project
;; ;; REQUIRES textmate-mode.el
;; (define-key evil-normal-state-map (kbd ",t") 'textmate-goto-file)
(define-key evil-normal-state-map (kbd ",T") 'helm-semantic-or-imenu)
(define-key evil-normal-state-map (kbd ", C-t") 'projectile-invalidate-cache)
;; (define-key evil-normal-state-map (kbd ",l") 'goto-line)

;; Projectile
(define-key evil-normal-state-map (kbd ",t") 'helm-projectile-find-file)
(define-key evil-normal-state-map (kbd "C-p") 'helm-show-kill-ring)


;; Spellcheck
(define-key evil-normal-state-map (kbd ",ce") 'flyspell-mode)
(define-key evil-normal-state-map (kbd ",cb") 'flyspell-buffer)
(define-key evil-normal-state-map (kbd ",cw") 'flyspell-word)
(define-key evil-normal-state-map (kbd ",cc") 'flyspell-correct-word-before-point)

;; Git tools
;; REQUIRES Magit
; Open git status buffer
(define-key evil-normal-state-map (kbd ",gs") 'magit-status) ;; git control panel
(define-key evil-normal-state-map (kbd ",gh") 'magit-file-log) ; Commit history for current file
(define-key evil-normal-state-map (kbd ",gb") 'magit-blame-mode) ; Blame for current file
(define-key evil-normal-state-map (kbd ",gg") 'magit-grep) ; Git grep

;; HG tools
;; REQUIRES Monky
; Open hg status buffer
(define-key evil-normal-state-map (kbd ",hs") 'monky-status)


;; Switch to another open buffer
(define-key evil-normal-state-map (kbd ",,") 'helm-mini)

;; Comment or uncomment the current line or marked region
;; REQUIRES CUSTOM DEFINED FUNTION
(define-key evil-normal-state-map (kbd ",/") 'comment-or-uncomment-region-or-line)
(define-key evil-visual-state-map (kbd ",/") 'comment-or-uncomment-region-or-line)

;; File tree navigation window
;; REQUIRES emacs-nav
(define-key evil-normal-state-map (kbd ",n") 'neotree-toggle)

;; Prompt for snippet
;; REQUIRES Yasnippet
(define-key evil-normal-state-map (kbd ", SPC") (lambda ()
                                                  (interactive)
                                                  (evil-insert-state)
                                                  (yas-insert-snippet)))

;; F#
(define-key evil-normal-state-map (kbd ",oe") 'fsharp-ac/next-error)
(define-key evil-normal-state-map (kbd ",od") 'fsharp-ac/gotodefn-at-point)
(define-key evil-normal-state-map (kbd ",or") 'fsharp-ac/load-project)

;; js2 mode
(define-key evil-normal-state-map (kbd ",ref") 'js2r-extract-function)
(define-key evil-normal-state-map (kbd ",rem") 'js2r-extract-method)
(define-key evil-normal-state-map (kbd ",rip") 'js2r-introduce-parameter)
(define-key evil-normal-state-map (kbd ",rlp") 'js2r-localize-parameter)
(define-key evil-normal-state-map (kbd ",reo") 'js2r-expand-object)
(define-key evil-normal-state-map (kbd ",rco") 'js2r-contract-object)
(define-key evil-normal-state-map (kbd ",rea") 'js2r-expand-array)
(define-key evil-normal-state-map (kbd ",rca") 'js2r-contract-array)
(define-key evil-normal-state-map (kbd ",reu") 'js2r-expand-function)
(define-key evil-normal-state-map (kbd ",rcu") 'js2r-contract-function)
(define-key evil-normal-state-map (kbd ",rev") 'js2r-extract-var)
(define-key evil-normal-state-map (kbd ",riv") 'js2r-inline-var)
(define-key evil-normal-state-map (kbd ",rrv") 'js2r-rename-var)
(define-key evil-normal-state-map (kbd ",rvt") 'js2r-var-to-this)
(define-key evil-normal-state-map (kbd ",rao") 'js2r-arguments-to-object)
(define-key evil-normal-state-map (kbd ",r?") 'js2r-ternary-to-if)
(define-key evil-normal-state-map (kbd ",ruw") 'js2r-unwrap)
(define-key evil-normal-state-map (kbd ",rcl") 'js2r-log-this)
(define-key evil-normal-state-map (kbd ",rsl") 'js2r-forward-slurp)
(define-key evil-normal-state-map (kbd ",rba") 'js2r-forward-barf)

;; Minimap
(define-key evil-normal-state-map (kbd ",m") 'minimap-toggle)

;; Window moving
(define-key evil-normal-state-map (kbd "C-w <left>") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-w <right>") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-w <up>") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-w <down>") 'windmove-down)

;; Find string recursively in files
(define-key evil-normal-state-map (kbd ",f") 'ack)

;; Show undo tree
(define-key evil-normal-state-map (kbd ",u") 'undo-tree-visualize)

;; Bind auto completion in insert mode, this clobbers the normal "next line" keybinding
;; (define-key evil-insert-state-map (kbd "C-n") 'auto-complete)

;; Dash
(define-key evil-normal-state-map (kbd ",d") 'dash-at-point)

;; Scala, requires ensime.
(evil-declare-key 'normal scala-mode-map (kbd ",jb") 'ensime)
(evil-declare-key 'normal scala-mode-map (kbd ",jcs") 'scala-switch-to-interpreter)
(evil-declare-key 'normal scala-mode-map (kbd ",jce") 'scala-eval-region)
(evil-declare-key 'normal scala-mode-map (kbd ",ji") 'ensime-inspect-type-at-point)
(evil-declare-key 'normal scala-mode-map (kbd ",jp") 'ensime-inspect-package-at-point)
(evil-declare-key 'normal scala-mode-map (kbd ",jrr") 'ensime-refactor-rename)
(evil-declare-key 'normal scala-mode-map (kbd ",jri") 'ensime-refactor-organize-imports)
(evil-declare-key 'normal scala-mode-map (kbd ",jra") 'ensime-import-type-at-point)
(evil-declare-key 'normal scala-mode-map (kbd ",jrm") 'ensime-refactor-extract-method)
(evil-declare-key 'normal scala-mode-map (kbd ",jrv") 'ensime-refactor-extract-local)
(evil-declare-key 'normal scala-mode-map (kbd ",jrl") 'ensime-refactor-inline-local)
(evil-declare-key 'normal scala-mode-map (kbd ",jru") 'ensime-undo-peek)
(evil-declare-key 'normal scala-mode-map (kbd ",jf") 'ensime-format-source)
(evil-declare-key 'normal scala-mode-map (kbd ",jg") 'ensime-edit-definition)
(evil-declare-key 'normal scala-mode-map (kbd ",js") 'ensime-search)
(evil-declare-key 'normal scala-mode-map (kbd ",jt") 'ensime-typecheck-all)
(evil-declare-key 'normal scala-mode-map (kbd ",jm") 'ensime-show-uses-of-symbol-at-point)
(evil-declare-key 'normal scala-mode-map (kbd ",jw") 'ensime-show-all-errors-and-warnings)
(evil-declare-key 'normal scala-mode-map (kbd ",jx") 'ensime-scalex-search)
(evil-declare-key 'normal scala-mode-map (kbd ",jd") 'ensime-show-doc-for-symbol-at-point)
(evil-declare-key 'normal scala-mode-map (kbd ",jcb") 'ensime-sbt-switch)
(evil-declare-key 'normal scala-mode-map (kbd ",jcc") 'ensime-sbt-do-compile)
(evil-declare-key 'normal scala-mode-map (kbd ",jcr") 'ensime-sbt-do-clean)


;; Java, requires eclim
(evil-declare-key 'normal java-mode-map (kbd ",jbd") 'start-eclimd)
(evil-declare-key 'normal java-mode-map (kbd ",jbe") 'eclim-mode)
(evil-declare-key 'normal java-mode-map (kbd ",jm") 'eclim-maven-run)
(evil-declare-key 'normal java-mode-map (kbd ",ja") 'eclim-ant-run)
(evil-declare-key 'normal java-mode-map (kbd ",je") 'eclim-project-build)
(evil-declare-key 'normal java-mode-map (kbd ",jt") 'eclim-problems)
(evil-declare-key 'normal java-mode-map (kbd ",jo") 'eclim-java-format)
(evil-declare-key 'normal java-mode-map (kbd ",jri") 'eclim-java-import-organize)
(evil-declare-key 'normal java-mode-map (kbd ",jrm") 'eclim-java-implement)
(evil-declare-key 'normal java-mode-map (kbd ",jrr") 'eclim-java-refactor-rename-symbol-at-point)
(evil-declare-key 'normal java-mode-map (kbd ",jra") 'eclim-java-generate-getter-and-setter)
(evil-declare-key 'normal java-mode-map (kbd ",jrc") 'eclim-problems-correct)
(evil-declare-key 'normal java-mode-map (kbd ",jd") 'eclim-java-show-documentation-for-current-element)
(evil-declare-key 'normal java-mode-map (kbd ",jh") 'eclim-java-hierarchy)
(evil-declare-key 'normal java-mode-map (kbd ",ji") 'eclim-java-find-type)
(evil-declare-key 'normal java-mode-map (kbd ",jf") 'eclim-java-find-references)
(evil-declare-key 'normal java-mode-map (kbd ",js") 'eclim-java-find-generic)


;; Mustache and handlebars generators
(evil-declare-key 'normal mustache-mode-map (kbd ",mt") 'mustache-insert-tag)
(evil-declare-key 'normal mustache-mode-map (kbd ",mb") 'mustache-insert-section)
(evil-declare-key 'normal mustache-mode-map (kbd ",mv") 'mustache-insert-variable)


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
