((ack status "installed" recipe
      (:name ack :type github :pkgname "leoliu/ack-el" :description "Use ack where you might usually use grep." :features ack))
 (auto-complete status "installed" recipe
		(:name auto-complete :website "http://cx4a.org/software/auto-complete/" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)))
 (auto-complete-css status "installed" recipe
		    (:name auto-complete-css :description "Auto-complete sources for CSS" :type http :url "http://www.cx4a.org/pub/auto-complete-css.el" :depends auto-complete))
 (auto-complete-ruby status "installed" recipe
		     (:name auto-complete-ruby :description "Auto-complete sources for Ruby" :type http :url "http://www.cx4a.org/pub/auto-complete-ruby.el" :depends
			    (auto-complete rcodetools)))
 (auto-complete-yasnippet status "installed" recipe
			  (:name auto-complete-yasnippet :description "Auto-complete sources for YASnippet" :type http :url "http://www.cx4a.org/pub/auto-complete-yasnippet.el" :depends
				 (auto-complete yasnippet)))
 (bundler status "installed" recipe
	  (:name bundler :description "Interact with Bundler from Emacs" :website "https://github.com/tobiassvn/bundler.el" :type github :pkgname "tobiassvn/bundler.el"))
 (coffee-mode status "installed" recipe
	      (:name coffee-mode :website "http://ozmm.org/posts/coffee_mode.html" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode" :features coffee-mode :post-init
		     (progn
		       (add-to-list 'auto-mode-alist
				    '("\\.coffee$" . coffee-mode))
		       (add-to-list 'auto-mode-alist
				    '("Cakefile" . coffee-mode))
		       (setq coffee-js-mode 'javascript-mode))))
 (dired-single status "installed" recipe
	       (:name dired-single :description "Reuse the current dired buffer to visit another directory" :type emacswiki :features "dired-single"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/scottaj/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "scottaj/el-get" :features el-get :info "." :load "el-get.el"))
 (emacs-nav status "installed" recipe
	    (:name emacs-nav :description "File tree browser" :type github :pkgname "scottaj/emacs-nav" :features nav))
 (evil status "installed" recipe
       (:name evil :website "http://gitorious.org/evil/pages/Home" :description "Evil is an extensible vi layer for Emacs. It\n       emulates the main features of Vim, and provides facilities\n       for writing custom extensions." :type git :url "https://git.gitorious.org/evil/evil.git" :features evil :depends undo-tree))
 (evil-numbers status "installed" recipe
	       (:name evil-numbers :website "http://github.com/cofi/evil-numbers" :description "Increment/decrement numbers in Evil, the extensible vim\n       emulation layer. Like C-a/C-x in vim.\n\n       After installation, you will need to add a key-binding for evil-numbers.\n       For example:\n\n       (define-key evil-normal-state-map (kbd \"C-c +\") 'evil-numbers/inc-at-pt)\n       (define-key evil-normal-state-map (kbd \"C-c -\") 'evil-numbers/dec-at-pt)" :type github :pkgname "cofi/evil-numbers" :features evil-numbers :depends evil))
 (evil-surround status "installed" recipe
		(:name evil-surround :website "http://github.com/timcharper/evil-surround" :description "Emulate Tim Pope's surround.vim in evil, the extensible vim\n       emulation layer for emacs" :type github :pkgname "timcharper/evil-surround" :features surround :post-init
		       (global-surround-mode 1)
		       :depends evil))
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
		 (:name flymake-coffee :type github :pkgname "purcell/flymake-coffee" :description "Flymake support for coffee script" :post-init
			(add-hook 'coffee-mode-hook 'flymake-coffee-load)
			:depends
			(flymake-easy)))
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
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/m2ym/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "m2ym/fuzzy-el"))
 (haml-mode status "installed" recipe
	    (:name haml-mode :description "Major mode for editing Haml files" :type github :pkgname "nex3/haml-mode"))
 (ido-hacks status "installed" recipe
	    (:name ido-hacks :description "Advices for ido-mode." :type github :pkgname "scottjad/ido-hacks" :features ido-hacks))
 (inf-ruby status "installed" recipe
	   (:name inf-ruby :description "Inferior Ruby Mode" :features inf-ruby :type elpa))
 (json status "installed" recipe
       (:name json :description "JavaScript Object Notation parser / generator" :type http :url "http://edward.oconnor.cx/elisp/json.el" :features json))
 (less-css-mode status "installed" recipe
		(:name less-css-mode :type github :pkgname "purcell/less-css-mode" :description "LESS CSS support" :post-init
		       (add-to-list 'auto-mode-alist
				    '("\\.less$" . less-css-mode))))
 (magit status "installed" recipe
	(:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :info "." :autoloads
	       ("50magit")
	       :build
	       (("make" "all"))
	       :build/darwin
	       `(,(concat "make EMACS=" el-get-emacs " all"))))
 (markdown-mode status "installed" recipe
		(:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :type git :url "git://jblevins.org/git/markdown-mode.git" :post-init
		       (add-to-list 'auto-mode-alist
				    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (mustache-mode status "installed" recipe
		(:name mustache-mode :description "Emacs Major Mode for Mustache" :features mustache-mode :type github :pkgname "mustache/emacs" :post-init
		       (progn
			 (add-to-list 'auto-mode-alist
				      '("\\.hs$" . mustache-mode))
			 (add-to-list 'auto-mode-alist
				      '("\\.handlebars$" . mustache-mode)))))
 (package status "installed" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin 24 :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
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
 (popup status "installed" recipe
	(:name popup :website "https://github.com/m2ym/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "auto-complete/popup-el"))
 (popup-kill-ring status "installed" recipe
		  (:name popup-kill-ring :description "Interactively insert item from kill-ring" :type emacswiki :depends
			 (popup pos-tip)))
 (pos-tip status "installed" recipe
	  (:name pos-tip :description "Show tooltip at point" :type emacswiki))
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
 (rvm status "installed" recipe
      (:name rvm :description "Emacs integration for rvm" :type github :features rvm :pkgname "senny/rvm.el" :compile "rvm.el" :post-init
	     (rvm-use-default)))
 (sass-mode status "installed" recipe
	    (:name sass-mode :description "Major mode for editing Sass files" :type github :pkgname "nex3/sass-mode" :depends haml-mode :post-init
		   (add-to-list 'auto-mode-alist
				'("\\.scss$" . sass-mode))))
 (scss-mode status "installed" recipe
	    (:name scss-mode :description "Major mode for editing SCSS files(http://sass-lang.com)" :type github :pkgname "antonj/scss-mode" :features scss-mode))
 (slim-mode status "installed" recipe
	    (:name slim-mode :description "Syntax highlighting for Slim" :type github :pkgname "bbatsov/slim-mode" :features slim-mode))
 (smex status "installed" recipe
       (:name smex :description "M-x interface with Ido-style fuzzy matching." :type github :pkgname "nonsequitur/smex" :features smex :post-init
	      (smex-initialize)))
 (textmate status "installed" recipe
	   (:name textmate :description "TextMate minor mode for Emacs" :type github :pkgname "defunkt/textmate.el" :features textmate :post-init
		  (textmate-mode)))
 (undo-tree status "installed" recipe
	    (:name undo-tree :description "Treat undo history as a tree" :type github :pkgname "emacsmirror/undo-tree"))
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
