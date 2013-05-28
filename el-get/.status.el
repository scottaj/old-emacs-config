((ac-nrepl status "installed" recipe
	   (:name ac-nrepl :description "Nrepl completion source for Emacs auto-complete package" :type github :pkgname "purcell/ac-nrepl" :depends
		  (auto-complete nrepl)
		  :features ac-nrepl))
 (ack status "installed" recipe
      (:name ack :type http :localname "ack.el" :url "http://repo.or.cz/w/ShellArchive.git?a=blob_plain;hb=HEAD;f=ack.el" :shallow nil :description "Use ack where you might usually use grep." :features ack))
 (auto-complete status "installed" recipe
		(:name auto-complete :website "http://cx4a.org/software/auto-complete/" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)))
 (auto-complete-css status "installed" recipe
		    (:name auto-complete-css :description "Auto-complete sources for CSS" :type http :url "http://www.cx4a.org/pub/auto-complete-css.el" :depends auto-complete))
 (auto-complete-ruby status "installed" recipe
		     (:name auto-complete-ruby :description "Auto-complete sources for Ruby" :type http :url "http://www.cx4a.org/pub/auto-complete-ruby.el" :depends
			    (auto-complete)))
 (auto-complete-yasnippet status "installed" recipe
			  (:name auto-complete-yasnippet :description "Auto-complete sources for YASnippet" :type http :url "http://www.cx4a.org/pub/auto-complete-yasnippet.el" :depends
				 (auto-complete yasnippet)))
 (autopair status "installed" recipe
	   (:name autopair :website "https://github.com/capitaomorte/autopair" :description "Autopair is an extension to the Emacs text editor that automatically pairs braces and quotes." :type github :pkgname "capitaomorte/autopair" :features autopair))
 (bundler status "installed" recipe
	  (:name bundler :description "Interact with Bundler from Emacs" :website "https://github.com/tobiassvn/bundler.el" :type github :pkgname "tobiassvn/bundler.el"))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (clojure-mode status "installed" recipe
	       (:name clojure-mode :website "https://github.com/technomancy/clojure-mode" :description "Emacs support for the Clojure language." :type github :pkgname "technomancy/clojure-mode"))
 (coffee-mode status "installed" recipe
	      (:name coffee-mode :website "http://ozmm.org/posts/coffee_mode.html" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode" :features coffee-mode :post-init
		     (progn
		       (add-to-list 'auto-mode-alist
				    '("\\.coffee$" . coffee-mode))
		       (add-to-list 'auto-mode-alist
				    '("Cakefile" . coffee-mode))
		       (setq coffee-js-mode 'javascript-mode))))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (dash-at-point status "installed" recipe
		(:name dash-at-point :type github :pkgname "stanaka/dash-at-point" :description "Dash documentation for word under point" :features dash-at-point))
 (dired-single status "installed" recipe
	       (:name dired-single :description "Reuse the current dired buffer to visit another directory" :type emacswiki :features "dired-single"))
 (eclim status "installed" recipe
	(:name eclim :website "https://github.com/senny/emacs-eclim/" :description "This project brings some of the great eclipse features to emacs developers." :type github :pkgname "senny/emacs-eclim" :features eclim :post-init
	       (progn
		 (setq eclim-auto-save t)
		 (global-eclim-mode -1))))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :info "." :load "el-get.el"))
 (ensime status "installed" recipe
	 (:name ensime :description "ENhanced Scala Interaction Mode for Emacs" :type github :pkgname "aemoncannon/ensime" :build
		("sbt update && sbt stage")
		:depends scala-mode2 :features ensime :load-path
		("./dist_2.10.0/elisp")
		:post-init
		(progn
		  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))))
 (evil status "installed" recipe
       (:name evil :website "http://gitorious.org/evil/pages/Home" :description "Evil is an extensible vi layer for Emacs. It\n       emulates the main features of Vim, and provides facilities\n       for writing custom extensions." :type git :url "https://git.gitorious.org/evil/evil.git" :features evil :depends undo-tree))
 (evil-numbers status "installed" recipe
	       (:name evil-numbers :website "http://github.com/cofi/evil-numbers" :description "Increment/decrement numbers in Evil, the extensible vim\n       emulation layer. Like C-a/C-x in vim.\n\n       After installation, you will need to add a key-binding for evil-numbers.\n       For example:\n\n       (define-key evil-normal-state-map (kbd \"C-c +\") 'evil-numbers/inc-at-pt)\n       (define-key evil-normal-state-map (kbd \"C-c -\") 'evil-numbers/dec-at-pt)" :type github :pkgname "cofi/evil-numbers" :features evil-numbers :depends evil))
 (evil-surround status "installed" recipe
		(:name evil-surround :website "http://github.com/timcharper/evil-surround" :description "Emulate Tim Pope's surround.vim in evil, the extensible vim\n       emulation layer for emacs" :type github :pkgname "timcharper/evil-surround" :features surround :post-init
		       (global-surround-mode 1)
		       :depends evil))
 (exec-path-from-shell status "installed" recipe
		       (:name exec-path-from-shell :website "http://github.com/purcell/exec-path-from-shell" :description "Fix shell settings in emacs on OSX" :type github :pkgname "purcell/exec-path-from-shell" :features exec-path-from-shell))
 (fastnav status "installed" recipe
	  (:name fastnav :website "https://github.com/gleber/fastnav.el" :description "Fast navigation and editing routines." :type github :pkgname "gleber/fastnav.el" :load-path "." :post-init
		 (progn
		   (require 'fastnav))))
 (feature-mode status "installed" recipe
	       (:name feature-mode :description "Major mode for Cucumber feature files" :type github :pkgname "scottaj/cucumber.el" :features feature-mode :post-init
		      (add-to-list 'auto-mode-alist
				   '("\\.feature\\'" . feature-mode))))
 (flymake status "installed" recipe
	  (:name flymake :description "Continuous syntax checking for Emacs." :type github :pkgname "illusori/emacs-flymake"))
 (flymake-coffee status "installed" recipe
		 (:name flymake-coffee :type github :pkgname "purcell/flymake-coffee" :description "Flymake support for coffee script" :website "http://github.com/purcell/flymake-coffee" :post-init
			(add-hook 'coffee-mode-hook 'flymake-coffee-load)))
 (flymake-css status "installed" recipe
	      (:name flymake-css :type github :pkgname "purcell/flymake-css" :description "Flymake support for css using csslint"))
 (flymake-easy status "installed" recipe
	       (:name flymake-easy :type github :pkgname "purcell/flymake-easy" :description "Easy setup for flymake" :website "http://github.com/purcell/flymake-easy"))
 (flymake-haml status "installed" recipe
	       (:name flymake-haml :type github :pkgname "purcell/flymake-haml" :description "Flymake handler for haml files" :website "http://github.com/purcell/flymake-haml" :post-init
		      (add-hook 'haml-mode-hook 'flymake-haml-load)))
 (flymake-ruby status "installed" recipe
	       (:name flymake-ruby :description "Steve Purcell's Ruby Flymake support, with stricter warnings." :type github :pkgname "purcell/flymake-ruby" :features flymake-ruby))
 (flymake-sass status "installed" recipe
	       (:name flymake-sass :type github :pkgname "purcell/flymake-sass" :description "Flymake handler for sass files"))
 (fringe-helper status "installed" recipe
		(:name fringe-helper :description "Helper functions for fringe bitmaps." :type http :url "http://nschum.de/src/emacs/fringe-helper/fringe-helper.el" :features fringe-helper))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (git-gutter status "installed" recipe
	     (:name git-gutter :description "Show git gutter in each buffer" :type github :pkgname "syohex/emacs-git-gutter" :features git-gutter))
 (git-gutter-fringe status "installed" recipe
		    (:name git-gutter-fringe :description "Show git gutter in each buffer" :type github :pkgname "syohex/emacs-git-gutter-fringe" :features git-gutter-fringe :depends
			   (git-gutter fringe-helper)))
 (haml-mode status "installed" recipe
	    (:name haml-mode :description "Major mode for editing Haml files" :type github :pkgname "nex3/haml-mode"))
 (idle-highlight-mode status "installed" recipe
		      (:name idle-highlight-mode :description "Idle Highlight Mode." :website "https://github.com/nonsequitur/idle-highlight-mode" :type github :pkgname "nonsequitur/idle-highlight-mode"))
 (ido-hacks status "installed" recipe
	    (:name ido-hacks :description "Advices for ido-mode." :type github :pkgname "scottjad/ido-hacks" :features ido-hacks))
 (inf-ruby status "installed" recipe
	   (:name inf-ruby :description "Inferior Ruby Mode - ruby process in a buffer." :type github :pkgname "danielsz/inf-ruby"))
 (inf-ruby-bond status "installed" recipe
		(:name inf-ruby-bond :description "Use Bond autocompletion from inf-ruby buffers" :type github :pkgname "pd/inf-ruby-bond" :depends inf-ruby :features inf-ruby-bond))
 (init-company-mode status "installed" recipe
		    (:name init-company-mode :auto-generated t :type emacswiki :description "Company-mode configuration" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/init-company-mode.el"))
 (js2-mode status "installed" recipe
	   (:name js2-mode :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
		  (autoload 'js2-mode "js2-mode" nil t)))
 (js2-refactor status "installed" recipe
	       (:name js2-refactor :description "This is a collection of small refactoring functions to further the idea of a JavaScript IDE in Emacs that started with js2-mode." :type github :pkgname "magnars/js2-refactor.el" :post-init
		      (add-hook 'js2-mode-hook
				(lambda nil
				  (require 'js2-refactor)))
		      :depends
		      (js2-mode dash multiple-cursors)))
 (less-css-mode status "installed" recipe
		(:name less-css-mode :type github :pkgname "purcell/less-css-mode" :description "LESS CSS support" :post-init
		       (add-to-list 'auto-mode-alist
				    '("\\.less$" . less-css-mode))))
 (lorem-ipsum status "installed" recipe
	      (:name lorem-ipsum :description "Lorem Ipsum Generator" :type emacswiki :features lorem-ipsum :prepare
		     (progn
		       (autoload 'Lorem-ipsum-insert-paragraphs "lorem-ipsum")
		       (autoload 'Lorem-ipsum-insert-sentences "lorem-ipsum")
		       (autoload 'Lorem-ipsum-insert-list "lorem-ipsum"))))
 (magit status "installed" recipe
	(:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :info "." :build
	       `(("make" ,(format "EMACS=%s" el-get-emacs)
		  "all"))
	       :build/berkeley-unix
	       (("touch" "`find . -name Makefile`")
		("gmake"))))
 (markdown-mode status "installed" recipe
		(:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :type git :url "git://jblevins.org/git/markdown-mode.git" :post-init
		       (add-to-list 'auto-mode-alist
				    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (monky status "installed" recipe
	(:name monky :description "Magit for Hg" :type github :pkgname "ananthakumaran/monky" :features monky))
 (multiple-cursors status "installed" recipe
		   (:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el" :features multiple-cursors))
 (mustache-mode status "installed" recipe
		(:name mustache-mode :description "Emacs Major Mode for Mustache" :features mustache-mode :type github :pkgname "mustache/emacs" :post-init
		       (progn
			 (add-to-list 'auto-mode-alist
				      '("\\.hs$" . mustache-mode))
			 (add-to-list 'auto-mode-alist
				      '("\\.handlebars$" . mustache-mode)))))
 (nav status "installed" recipe
      (:name nav :description "Emacs mode for filesystem navigation" :type hg :url "https://emacs-nav.googlecode.com/hg" :features nav))
 (nrepl status "installed" recipe
	(:name nrepl :description "An Emacs client for nREPL, the Clojure networked REPL server." :type github :pkgname "kingtim/nrepl.el" :depends clojure-mode))
 (package status "installed" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
		 (progn
		   (setq package-user-dir
			 (expand-file-name
			  (convert-standard-filename
			   (concat
			    (file-name-as-directory default-directory)
			    "elpa")))
			 package-directory-list
			 (list
			  (file-name-as-directory package-user-dir)
			  "/usr/share/emacs/site-lisp/elpa/"))
		   (make-directory package-user-dir t)
		   (unless
		       (boundp 'package-subdirectory-regexp)
		     (defconst package-subdirectory-regexp "^\\([^.].*\\)-\\([0-9]+\\(?:[.][0-9]+\\)*\\)$" "Regular expression matching the name of\n a package subdirectory. The first subexpression is the package\n name. The second subexpression is the version string."))
		   (setq package-archives
			 '(("ELPA" . "http://tromey.com/elpa/")
			   ("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (paredit status "installed" recipe
	  (:name paredit :description "Minor mode for editing parentheses" :type http :url "http://mumble.net/~campbell/emacs/paredit.el" :features "paredit"))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/m2ym/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "auto-complete/popup-el"))
 (popup-kill-ring status "installed" recipe
		  (:name popup-kill-ring :description "Interactively insert item from kill-ring" :type emacswiki :depends
			 (popup pos-tip)))
 (pos-tip status "installed" recipe
	  (:name pos-tip :description "Show tooltip at point" :type emacswiki))
 (pretty-mode status "installed" recipe
	      (:name pretty-mode :website "https://github.com/scottaj/pretty-symbols" :description "Pretty unicode symbols" :type github :pkgname "scottaj/pretty-symbols" :features pretty-mode))
 (rainbow-delimiters status "installed" recipe
		     (:name rainbow-delimiters :website "https://github.com/jlr/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "jlr/rainbow-delimiters" :features rainbow-delimiters))
 (rcodetools status "installed" recipe
	     (:name rcodetools :description "Ruby code tools" :type github :pkgname "tnoda/rcodetools"))
 (rhtml-mode status "installed" recipe
	     (:name rhtml-mode :description "Major mode for editing RHTML files" :type github :pkgname "eschulte/rhtml" :prepare
		    (progn
		      (autoload 'rhtml-mode "rhtml-mode" nil t)
		      (add-to-list 'auto-mode-alist
				   '("\\.html.erb$" . rhtml-mode)))))
 (rspec-mode status "installed" recipe
	     (:name rspec-mode :description "Enhance ruby-mode for RSpec" :type github :pkgname "pezra/rspec-mode" :features rspec-mode))
 (ruby-end status "installed" recipe
	   (:name ruby-end :description "Emacs minor mode for automatic insertion of end blocks for Ruby" :type github :pkgname "rejeep/ruby-end" :features ruby-end))
 (rvm status "installed" recipe
      (:name rvm :description "Emacs integration for rvm" :type github :features rvm :pkgname "senny/rvm.el" :compile "rvm.el" :post-init
	     (rvm-use-default)))
 (sass-mode status "installed" recipe
	    (:name sass-mode :description "Major mode for editing Sass files" :type github :pkgname "nex3/sass-mode" :depends haml-mode :post-init
		   (add-to-list 'auto-mode-alist
				'("\\.scss$" . sass-mode))))
 (scala-mode status "installed" recipe
	     (:name scala-mode :description "Major mode for editing Scala code." :type git :url "https://github.com/scala/scala-dist.git" :build
		    `(("make -C tool-support/src/emacs" ,(concat "ELISP_COMMAND=" el-get-emacs)))
		    :load-path
		    ("tool-support/src/emacs")
		    :features scala-mode-auto))
 (scala-mode2 status "installed" recipe
	      (:name scala-mode2 :website "https://github.com/hvesalai/scala-mode2" :description "A new scala-mode for Emacs 24" :type github :pkgname "hvesalai/scala-mode2" :load-path "." :features scala-mode2))
 (scss-mode status "installed" recipe
	    (:name scss-mode :description "Major mode for editing SCSS files(http://sass-lang.com)" :type github :pkgname "antonj/scss-mode" :features scss-mode))
 (slim-mode status "installed" recipe
	    (:name slim-mode :description "Syntax highlighting for Slim" :type github :pkgname "slim-template/emacs-slim" :features slim-mode))
 (smex status "installed" recipe
       (:name smex :description "M-x interface with Ido-style fuzzy matching." :type github :pkgname "nonsequitur/smex" :features smex :post-init
	      (smex-initialize)))
 (solarized-theme status "installed" recipe
		  (:name solarized-theme :type github :pkgname "sellout/emacs-color-theme-solarized" :description "Solarized themes for Emacs" :prepare
			 (add-to-list 'custom-theme-load-path default-directory)))
 (textmate status "installed" recipe
	   (:name textmate :description "TextMate minor mode for Emacs" :type github :pkgname "defunkt/textmate.el" :features textmate :post-init
		  (textmate-mode)))
 (undo-tree status "installed" recipe
	    (:name undo-tree :description "Treat undo history as a tree" :type git :url "http://www.dr-qubit.org/git/undo-tree.git" :prepare
		   (progn
		     (autoload 'undo-tree-mode "undo-tree.el" "Undo tree mode; see undo-tree.el for details" t)
		     (autoload 'global-undo-tree-mode "undo-tree.el" "Global undo tree mode" t))))
 (web-mode status "installed" recipe
	   (:name web-mode :type github :pkgname "fxbois/web-mode" :features web-mode :post-init
		  (add-to-list 'auto-mode-alist
			       '("\\.html?\\'" . web-mode))))
 (yaml-mode status "installed" recipe
	    (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode" :prepare
		   (progn
		     (autoload 'yaml-mode "yaml-mode" nil t)
		     (add-to-list 'auto-mode-alist
				  '("\\.ya?ml\\'" . yaml-mode)))))
 (yasnippet status "installed" recipe
	    (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
		   (unless
		       (or
			(boundp 'yas/snippet-dirs)
			(get 'yas/snippet-dirs 'customized-value))
		     (setq yas/snippet-dirs
			   (list
			    (concat el-get-dir
				    (file-name-as-directory "yasnippet")
				    "snippets"))))
		   :post-init
		   (put 'yas/snippet-dirs 'standard-value
			(list
			 (list 'quote
			       (list
				(concat el-get-dir
					(file-name-as-directory "yasnippet")
					"snippets")))))
		   :compile nil :submodule nil)))
