;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ack) "ack/ack" "ack/ack.el" (20788 11707))
;;; Generated autoloads from ack/ack.el

(autoload 'ack "ack/ack" "\
Run ack using COMMAND-ARGS and collect output in a buffer.
When called interactively, the value of DIRECTORY is provided by
`ack-default-directory-function'.

The following keys are available while reading from the
minibuffer:

\\{ack-minibuffer-local-map}

\(fn COMMAND-ARGS &optional DIRECTORY)" t nil)

;;;***

;;;### (autoloads (pcomplete/ack) "ack/pcmpl-ack" "ack/pcmpl-ack.el"
;;;;;;  (20788 11707))
;;; Generated autoloads from ack/pcmpl-ack.el

(autoload 'pcomplete/ack "ack/pcmpl-ack" "\
Completion for the `ack' command.
Start an argument with '-' to complete short options and '--' for
long options.

\(fn)" nil nil)

(defalias 'pcomplete/ack-grep 'pcomplete/ack)

;;;***

;;;### (autoloads (auto-complete) "auto-complete/auto-complete" "auto-complete/auto-complete.el"
;;;;;;  (20788 11712))
;;; Generated autoloads from auto-complete/auto-complete.el

(autoload 'auto-complete "auto-complete/auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

;;;***

;;;### (autoloads (bundle-update bundle-install bundle-check bundle-console
;;;;;;  bundle-open) "bundler/bundler" "bundler/bundler.el" (20788
;;;;;;  11776))
;;; Generated autoloads from bundler/bundler.el

(autoload 'bundle-open "bundler/bundler" "\
Queries for a gem name and opens the location of the gem in dired.

\(fn GEM-NAME)" t nil)

(autoload 'bundle-console "bundler/bundler" "\
Run an inferior Ruby process in the context of the current bundle.

\(fn)" t nil)

(autoload 'bundle-check "bundler/bundler" "\
Run bundle check for the current bundle.

\(fn)" t nil)

(autoload 'bundle-install "bundler/bundler" "\
Run bundle install for the current bundle.

\(fn)" t nil)

(autoload 'bundle-update "bundler/bundler" "\
Run bundle update for the current bundle.

\(fn &optional UPDATE-CMD-ARGS)" t nil)

;;;***

;;;### (autoloads (coffee-mode) "coffee-mode/coffee-mode" "coffee-mode/coffee-mode.el"
;;;;;;  (20788 11731))
;;; Generated autoloads from coffee-mode/coffee-mode.el

(autoload 'coffee-mode "coffee-mode/coffee-mode" "\
Major mode for editing CoffeeScript.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))

(add-to-list 'auto-mode-alist '("\\.iced\\'" . coffee-mode))

(add-to-list 'auto-mode-alist '("Cakefile\\'" . coffee-mode))

;;;***

;;;### (autoloads (dired-single-toggle-buffer-name dired-single-magic-buffer
;;;;;;  dired-single-buffer-mouse dired-single-buffer) "dired-single/dired-single"
;;;;;;  "dired-single/dired-single.el" (20788 11693))
;;; Generated autoloads from dired-single/dired-single.el

(autoload 'dired-single-buffer "dired-single/dired-single" "\
Visit selected directory in current buffer.

Visits the selected directory in the current buffer, replacing the
   current contents with the contents of the new directory.  This doesn't
   prevent you from having more than one dired buffer.  The main difference
   is that a given dired buffer will not spawn off a new buffer every time
   a new directory is visited.

If the variable `dired-single-use-magic-buffer' is non-nil, and the current
   buffer's name is the same as that specified by the variable
`dired-single-magic-buffer-name', then the new directory's buffer will retain
   that same name (i.e. not only will dired only use a single buffer, but
its name will not change every time a new directory is entered).

Optional argument DEFAULT-DIRNAME specifies the directory to visit; if not
specified, the directory or file on the current line is used (assuming it's
a dired buffer).  If the current line represents a file, the file is visited
in another window.

\(fn &optional DEFAULT-DIRNAME)" t nil)

(autoload 'dired-single-buffer-mouse "dired-single/dired-single" "\
Mouse-initiated version of `dired-single-buffer' (which see).

Argument CLICK is the mouse-click event.

\(fn CLICK)" t nil)

(autoload 'dired-single-magic-buffer "dired-single/dired-single" "\
Switch to buffer whose name is the value of `dired-single-magic-buffer-name'.

If no such buffer exists, launch dired in a new buffer and rename that buffer
to the value of `dired-single-magic-buffer-name'.  If the current buffer is the
magic buffer, it will prompt for a new directory to visit.

Optional argument DEFAULT-DIRNAME specifies the directory to visit (defaults to
the currently displayed directory).

\(fn &optional DEFAULT-DIRNAME)" t nil)

(autoload 'dired-single-toggle-buffer-name "dired-single/dired-single" "\
Toggle between the 'magic' buffer name and the 'real' dired buffer name.

Will also seek to uniquify the 'real' buffer name.

\(fn)" t nil)

;;;***

;;;### (autoloads (el-get-checksum el-get-make-recipes el-get-cd
;;;;;;  el-get-self-update el-get-update-all el-get-version) "el-get/el-get"
;;;;;;  "el-get/el-get.el" (20788 11567))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE &optional PACKAGE-STATUS-ALIST)" t nil)

;;;***

;;;### (autoloads (el-get-list-packages) "el-get/el-get-list-packages"
;;;;;;  "el-get/el-get-list-packages.el" (20788 11567))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "emacs-nav/ack" "emacs-nav/ack.el" (20788 11701))
;;; Generated autoloads from emacs-nav/ack.el

(defvar ack-history nil)

;;;***

;;;### (autoloads (nav) "emacs-nav/nav" "emacs-nav/nav.el" (20788
;;;;;;  11701))
;;; Generated autoloads from emacs-nav/nav.el

(autoload 'nav "emacs-nav/nav" "\
Opens Nav in a new window to the left of the current one.

\(fn)" t nil)

;;;***

;;;### (autoloads (evil-numbers/dec-at-pt evil-numbers/inc-at-pt)
;;;;;;  "evil-numbers/evil-numbers" "evil-numbers/evil-numbers.el"
;;;;;;  (20788 11683))
;;; Generated autoloads from evil-numbers/evil-numbers.el

(autoload 'evil-numbers/inc-at-pt "evil-numbers/evil-numbers" "\
Increment the number at point or after point before end-of-line by `amount'

\(fn AMOUNT)" t nil)

(autoload 'evil-numbers/dec-at-pt "evil-numbers/evil-numbers" "\
Decrement the number at point or after point before end-of-line by `amount'

\(fn AMOUNT)" t nil)

;;;***

;;;### (autoloads (global-surround-mode turn-off-surround-mode turn-on-surround-mode
;;;;;;  surround-mode surround-change surround-delete) "evil-surround/surround"
;;;;;;  "evil-surround/surround.el" (20788 11684))
;;; Generated autoloads from evil-surround/surround.el

(autoload 'surround-delete "evil-surround/surround" "\
Delete the surrounding delimiters represented by CHAR.
Alternatively, the text to delete can be represented with
the overlays OUTER and INNER, where OUTER includes the delimiters
and INNER excludes them. The intersection (i.e., difference)
between these overlays is what is deleted.

\(fn CHAR &optional OUTER INNER)" t nil)

(autoload 'surround-change "evil-surround/surround" "\
Change the surrounding delimiters represented by CHAR.
Alternatively, the text to delete can be represented with the
overlays OUTER and INNER, which are passed to `surround-delete'.

\(fn CHAR &optional OUTER INNER)" t nil)

(autoload 'surround-mode "evil-surround/surround" "\
Buffer-local minor mode to emulate surround.vim.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-surround-mode "evil-surround/surround" "\
Enable surround-mode in the current buffer.

\(fn)" nil nil)

(autoload 'turn-off-surround-mode "evil-surround/surround" "\
Disable surround-mode in the current buffer.

\(fn)" nil nil)

(defvar global-surround-mode nil "\
Non-nil if Global-Surround mode is enabled.
See the command `global-surround-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-surround-mode'.")

(custom-autoload 'global-surround-mode "evil-surround/surround" nil)

(autoload 'global-surround-mode "evil-surround/surround" "\
Toggle Surround mode in all buffers.
With prefix ARG, enable Global-Surround mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Surround mode is enabled in all buffers where
`turn-on-surround-mode' would do it.
See `surround-mode' for more information on Surround mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "evil/evil-core" "evil/evil-core.el" (20788
;;;;;;  11679))
;;; Generated autoloads from evil/evil-core.el
 (autoload 'evil-mode "evil" "Toggle evil in all buffers" t)

;;;***

;;;### (autoloads (fastnav-sprint-backward fastnav-sprint-forward
;;;;;;  fastnav-delete-char-backward fastnav-delete-char-forward
;;;;;;  fastnav-execute-at-char-backward fastnav-execute-at-char-forward
;;;;;;  fastnav-insert-at-char-backward fastnav-insert-at-char-forward
;;;;;;  fastnav-replace-char-backward fastnav-replace-char-forward
;;;;;;  fastnav-zap-to-char-backward fastnav-zap-to-char-forward
;;;;;;  fastnav-zap-up-to-char-backward fastnav-zap-up-to-char-forward
;;;;;;  fastnav-mark-to-char-backward fastnav-mark-to-char-forward
;;;;;;  fastnav-mark-up-to-char-xbackward fastnav-mark-up-to-char-forward
;;;;;;  fastnav-jump-to-char-backward fastnav-jump-to-char-forward
;;;;;;  fastnav-highlight-read-char-backward fastnav-highlight-read-char
;;;;;;  fastnav-get-nth-chars fastnav-search-char-backward fastnav-search-char-forward)
;;;;;;  "fastnav/fastnav" "fastnav/fastnav.el" (20788 11695))
;;; Generated autoloads from fastnav/fastnav.el

(autoload 'fastnav-search-char-forward "fastnav/fastnav" "\
Moves to the arg-th occurrence of char forward (backward if N
is negative).  If there isn't room, go as far as possible (no
error).

\(fn ARG CHAR)" nil nil)

(autoload 'fastnav-search-char-backward "fastnav/fastnav" "\
Moves to the arg-th occurrence of char backward (forward if N
is negative).  If there isn't room, go as far as possible (no
error).

\(fn ARG CHAR)" nil nil)

(autoload 'fastnav-get-nth-chars "fastnav/fastnav" "\
Computes and returns the positions of the ARG'th occurrence of
characters of the range 1 .. 255.

\(fn ARG)" nil nil)

(autoload 'fastnav-highlight-read-char "fastnav/fastnav" "\
Highlights the ARG'th occurences of each character while
querying one using message TEXT. Negative ARG means backward
search of occurences.

\(fn TEXT ARG FORWARDER BACKWARDER)" nil nil)

(autoload 'fastnav-highlight-read-char-backward "fastnav/fastnav" "\
Highlights the backward ARG'th occurences of each character
while querying one using message TEXT.

\(fn TEXT ARG FORWARDER BACKWARDER)" nil nil)

(autoload 'fastnav-jump-to-char-forward "fastnav/fastnav" "\
Jump to the ARG'th occurence of a character that is queried
interactively while highlighting the possible positions.

\(fn ARG)" t nil)

(autoload 'fastnav-jump-to-char-backward "fastnav/fastnav" "\
Jump backward to the ARG'th occurence of a character that is
queried interactively while highlighting the possible positions.

\(fn ARG)" t nil)

(autoload 'fastnav-mark-up-to-char-forward "fastnav/fastnav" "\
Set mark before the ARG'th occurence of a character queried
interactively.

\(fn ARG)" t nil)

(autoload 'fastnav-mark-up-to-char-xbackward "fastnav/fastnav" "\
Set mark backward after the ARG'th occurence of a character
queried interactively.

\(fn ARG)" t nil)

(autoload 'fastnav-mark-to-char-forward "fastnav/fastnav" "\
Set mark before the ARG'th occurence of a character queried
interactively.

\(fn ARG)" t nil)

(autoload 'fastnav-mark-to-char-backward "fastnav/fastnav" "\
Set mark backward after the ARG'th occurence of a character
queried interactively.

\(fn ARG)" t nil)

(autoload 'fastnav-zap-up-to-char-forward "fastnav/fastnav" "\
Kill text up to the ARG'th occurence of a character queried
interactively.

\(fn ARG)" t nil)

(autoload 'fastnav-zap-up-to-char-backward "fastnav/fastnav" "\
Kill text backward to the ARG'th occurence of a character
queried interactively.

\(fn ARG)" t nil)

(autoload 'fastnav-zap-to-char-forward "fastnav/fastnav" "\
Kill text up to and including the ARG'th occurence of a character queried
interactively.

\(fn ARG)" t nil)

(autoload 'fastnav-zap-to-char-backward "fastnav/fastnav" "\
Kill text backward to the ARG'th occurence of a character
queried interactively.

\(fn ARG)" t nil)

(autoload 'fastnav-replace-char-forward "fastnav/fastnav" "\
Interactively replaces the ARG'th occurence of a character.

\(fn ARG)" t nil)

(autoload 'fastnav-replace-char-backward "fastnav/fastnav" "\
Interactively replaces the ARG'th backward occurence of a
character.

\(fn ARG)" t nil)

(autoload 'fastnav-insert-at-char-forward "fastnav/fastnav" "\
Queries for a character and a string that is insterted at
the ARG'th occurence of the character.

\(fn ARG)" t nil)

(autoload 'fastnav-insert-at-char-backward "fastnav/fastnav" "\
Queries for a character and a string that is insterted at
the backward ARG'th occurence of the character.

\(fn ARG)" t nil)

(autoload 'fastnav-execute-at-char-forward "fastnav/fastnav" "\
Queries for a character and a key sequence that is executed at
the ARG'th occurence of the character.

\(fn ARG)" t nil)

(autoload 'fastnav-execute-at-char-backward "fastnav/fastnav" "\
Queries for a character and a key sequence that is executed at
the backward ARG'th occurence of the character.

\(fn ARG)" t nil)

(autoload 'fastnav-delete-char-forward "fastnav/fastnav" "\
Deletes the ARG'th occurence of a character, which is queried
interactively while highlighting the possible positions.

\(fn ARG)" t nil)

(autoload 'fastnav-delete-char-backward "fastnav/fastnav" "\
Deletes the backward ARG'th occurence of a character, which is
queried interactively while highlighting the possible positions.

\(fn ARG)" t nil)

(autoload 'fastnav-sprint-forward "fastnav/fastnav" "\
Performs a sequence of jumping forward to the next character
matching the keyboard event.

\(fn ARG)" t nil)

(autoload 'fastnav-sprint-backward "fastnav/fastnav" "\
Performs a sequence of jumping backward to the next character
matching the keyboard event.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads (feature-mode) "feature-mode/feature-mode" "feature-mode/feature-mode.el"
;;;;;;  (20788 11750))
;;; Generated autoloads from feature-mode/feature-mode.el

(autoload 'feature-mode "feature-mode/feature-mode" "\
Major mode for editing plain text stories

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.feature\\'" . feature-mode))

;;;***

;;;### (autoloads (flymake-coffee-load) "flymake-coffee/flymake-coffee"
;;;;;;  "flymake-coffee/flymake-coffee.el" (20788 11759))
;;; Generated autoloads from flymake-coffee/flymake-coffee.el

(autoload 'flymake-coffee-load "flymake-coffee/flymake-coffee" "\
Configure flymake mode to check the current buffer's coffeescript syntax.

\(fn)" t nil)

;;;***

;;;### (autoloads (flymake-css-load flymake-css-lint-command) "flymake-css/flymake-css"
;;;;;;  "flymake-css/flymake-css.el" (20788 11762))
;;; Generated autoloads from flymake-css/flymake-css.el

(defvar flymake-css-lint-command "csslint" "\
Name (and optionally full path) of csslint executable.")

(custom-autoload 'flymake-css-lint-command "flymake-css/flymake-css" t)

(autoload 'flymake-css-load "flymake-css/flymake-css" "\
Configure flymake mode to check the current buffer's css syntax.

\(fn)" t nil)

;;;***

;;;### (autoloads (flymake-haml-load) "flymake-haml/flymake-haml"
;;;;;;  "flymake-haml/flymake-haml.el" (20788 11764))
;;; Generated autoloads from flymake-haml/flymake-haml.el

(autoload 'flymake-haml-load "flymake-haml/flymake-haml" "\
Configure flymake mode to check the current buffer's haml syntax.

This function is designed to be called in `haml-mode-hook'; it
does not alter flymake's global configuration, so function
`flymake-mode' alone will not suffice.

\(fn)" t nil)

;;;***

;;;### (autoloads (flymake-ruby-load) "flymake-ruby/flymake-ruby"
;;;;;;  "flymake-ruby/flymake-ruby.el" (20788 11768))
;;; Generated autoloads from flymake-ruby/flymake-ruby.el

(autoload 'flymake-ruby-load "flymake-ruby/flymake-ruby" "\
Configure flymake mode to check the current buffer's ruby syntax.

\(fn)" t nil)

;;;***

;;;### (autoloads (flymake-sass-load) "flymake-sass/flymake-sass"
;;;;;;  "flymake-sass/flymake-sass.el" (20788 11761))
;;; Generated autoloads from flymake-sass/flymake-sass.el

(autoload 'flymake-sass-load "flymake-sass/flymake-sass" "\
Configure flymake mode to check the current buffer's sass syntax.

\(fn)" t nil)

;;;***

;;;### (autoloads (flymake-find-file-hook flymake-mode-off flymake-mode-on
;;;;;;  flymake-mode) "flymake/flymake" "flymake/flymake.el" (20788
;;;;;;  11756))
;;; Generated autoloads from flymake/flymake.el

(autoload 'flymake-mode "flymake/flymake" "\
Toggle on-the-fly syntax checking.
With a prefix argument ARG, enable the mode if ARG is positive,
and disable it otherwise.  If called from Lisp, enable the mode
if ARG is omitted or nil.

\(fn &optional ARG)" t nil)

(autoload 'flymake-mode-on "flymake/flymake" "\
Turn flymake mode on.

\(fn)" nil nil)

(autoload 'flymake-mode-off "flymake/flymake" "\
Turn flymake mode off.

\(fn)" nil nil)

(autoload 'flymake-find-file-hook "flymake/flymake" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (haml-mode) "haml-mode/haml-mode" "haml-mode/haml-mode.el"
;;;;;;  (20788 11740))
;;; Generated autoloads from haml-mode/haml-mode.el

(autoload 'haml-mode "haml-mode/haml-mode" "\
Major mode for editing Haml files.

\\{haml-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))

;;;***

;;;### (autoloads (run-ruby inf-ruby inf-ruby-setup-keybindings)
;;;;;;  "inf-ruby/inf-ruby" "inf-ruby/inf-ruby.el" (20788 11773))
;;; Generated autoloads from inf-ruby/inf-ruby.el

(autoload 'inf-ruby-setup-keybindings "inf-ruby/inf-ruby" "\
Set local key defs to invoke inf-ruby from ruby-mode.

\(fn)" nil nil)

(autoload 'inf-ruby "inf-ruby/inf-ruby" "\
Run an inferior Ruby process in a buffer.
With prefix argument, prompts for which Ruby implementation
\(from the list `inf-ruby-implementations') to use. Runs the
hooks `inf-ruby-mode-hook' (after the `comint-mode-hook' is
run).

\(fn &optional IMPL)" t nil)

(autoload 'run-ruby "inf-ruby/inf-ruby" "\
Run an inferior Ruby process, input and output via buffer *ruby*.
If there is a process already running in `*ruby*', switch to that buffer.
With argument, allows you to edit the command line (default is value
of `ruby-program-name').  Runs the hooks `inferior-ruby-mode-hook'
\(after the `comint-mode-hook' is run).
\(Type \\[describe-mode] in the process buffer for a list of commands.)

\(fn &optional COMMAND NAME)" t nil)

(eval-after-load 'ruby-mode '(inf-ruby-setup-keybindings))

;;;***

;;;### (autoloads (flymake-less-css-init less-css-mode less-css-compile)
;;;;;;  "less-css-mode/less-css-mode" "less-css-mode/less-css-mode.el"
;;;;;;  (20788 11755))
;;; Generated autoloads from less-css-mode/less-css-mode.el

(autoload 'less-css-compile "less-css-mode/less-css-mode" "\
Compiles the current buffer to css using `less-css-lessc-command'.

\(fn)" t nil)

(autoload 'less-css-mode "less-css-mode/less-css-mode" "\
Major mode for editing LESS files, http://lesscss.org/
Special commands:
\\{less-css-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.less" . less-css-mode))

(autoload 'flymake-less-css-init "less-css-mode/less-css-mode" "\
Flymake support for LESS files

\(fn)" nil nil)

;;;***

;;;### (autoloads (magit-status) "magit/magit" "magit/magit.el" (20788
;;;;;;  11689))
;;; Generated autoloads from magit/magit.el

(autoload 'magit-status "magit/magit" "\
Open a Magit status buffer for the Git repository containing DIR.
If DIR is not within a Git repository, offer to create a Git
repository in DIR.

Interactively, a prefix argument means to ask the user which Git
repository to use even if `default-directory' is under Git
control.  Two prefix arguments means to ignore `magit-repo-dirs'
when asking for user input.

\(fn DIR)" t nil)

;;;***

;;;### (autoloads (magit-blame-mode) "magit/magit-blame" "magit/magit-blame.el"
;;;;;;  (20788 11689))
;;; Generated autoloads from magit/magit-blame.el

(autoload 'magit-blame-mode "magit/magit-blame" "\
Display blame information inline.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (turn-on-magit-flow magit-flow-mode) "magit/magit-flow"
;;;;;;  "magit/magit-flow.el" (20788 11689))
;;; Generated autoloads from magit/magit-flow.el

(autoload 'magit-flow-mode "magit/magit-flow" "\
FLOW support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-flow "magit/magit-flow" "\
Unconditionally turn on `magit-flow-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (turn-on-magit-stgit magit-stgit-mode) "magit/magit-stgit"
;;;;;;  "magit/magit-stgit.el" (20788 11689))
;;; Generated autoloads from magit/magit-stgit.el

(autoload 'magit-stgit-mode "magit/magit-stgit" "\
StGit support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-stgit "magit/magit-stgit" "\
Unconditionally turn on `magit-stgit-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (turn-on-magit-svn magit-svn-mode) "magit/magit-svn"
;;;;;;  "magit/magit-svn.el" (20788 11689))
;;; Generated autoloads from magit/magit-svn.el

(autoload 'magit-svn-mode "magit/magit-svn" "\
SVN support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-svn "magit/magit-svn" "\
Unconditionally turn on `magit-svn-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (turn-on-magit-topgit magit-topgit-mode) "magit/magit-topgit"
;;;;;;  "magit/magit-topgit.el" (20788 11689))
;;; Generated autoloads from magit/magit-topgit.el

(autoload 'magit-topgit-mode "magit/magit-topgit" "\
Topgit support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-topgit "magit/magit-topgit" "\
Unconditionally turn on `magit-topgit-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (global-magit-wip-save-mode magit-wip-save-mode
;;;;;;  magit-wip-mode) "magit/magit-wip" "magit/magit-wip.el" (20788
;;;;;;  11689))
;;; Generated autoloads from magit/magit-wip.el

(defvar magit-wip-mode nil "\
Non-nil if Magit-Wip mode is enabled.
See the command `magit-wip-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `magit-wip-mode'.")

(custom-autoload 'magit-wip-mode "magit/magit-wip" nil)

(autoload 'magit-wip-mode "magit/magit-wip" "\
In Magit log buffers; give wip refs a special appearance.

\(fn &optional ARG)" t nil)

(autoload 'magit-wip-save-mode "magit/magit-wip" "\
Magit support for committing to a work-in-progress ref.

When this minor mode is turned on and a file is saved inside a writable
git repository then it is also committed to a special work-in-progress
ref.

\(fn &optional ARG)" t nil)

(defvar global-magit-wip-save-mode nil "\
Non-nil if Global-Magit-Wip-Save mode is enabled.
See the command `global-magit-wip-save-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-magit-wip-save-mode'.")

(custom-autoload 'global-magit-wip-save-mode "magit/magit-wip" nil)

(autoload 'global-magit-wip-save-mode "magit/magit-wip" "\
Toggle Magit-Wip-Save mode in all buffers.
With prefix ARG, enable Global-Magit-Wip-Save mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Magit-Wip-Save mode is enabled in all buffers where
`turn-on-magit-wip-save' would do it.
See `magit-wip-save-mode' for more information on Magit-Wip-Save mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (rebase-mode) "magit/rebase-mode" "magit/rebase-mode.el"
;;;;;;  (20788 11689))
;;; Generated autoloads from magit/rebase-mode.el

(autoload 'rebase-mode "magit/rebase-mode" "\
Major mode for editing of a Git rebase file.

Rebase files are generated when you run 'git rebase -i' or run
`magit-interactive-rebase'.  They describe how Git should perform
the rebase.  See the documentation for git-rebase (e.g., by
running 'man git-rebase' at the command line) for details.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("git-rebase-todo" . rebase-mode))

;;;***

;;;### (autoloads (gfm-mode markdown-mode) "markdown-mode/markdown-mode"
;;;;;;  "markdown-mode/markdown-mode.el" (20788 11735))
;;; Generated autoloads from markdown-mode/markdown-mode.el

(autoload 'markdown-mode "markdown-mode/markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

(autoload 'gfm-mode "markdown-mode/markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t nil)

;;;***

;;;### (autoloads (mustache-mode) "mustache-mode/mustache-mode" "mustache-mode/mustache-mode.el"
;;;;;;  (20788 11749))
;;; Generated autoloads from mustache-mode/mustache-mode.el

(autoload 'mustache-mode "mustache-mode/mustache-mode" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (rspec-buffer-is-spec-p rspec-verifiable-mode rspec-mode)
;;;;;;  "rspec-mode/rspec-mode" "rspec-mode/rspec-mode.el" (20788
;;;;;;  11775))
;;; Generated autoloads from rspec-mode/rspec-mode.el

(autoload 'rspec-mode "rspec-mode/rspec-mode" "\
Minor mode for RSpec files

\(fn &optional ARG)" t nil)

(autoload 'rspec-verifiable-mode "rspec-mode/rspec-mode" "\
Minor mode for Ruby files that have specs

\(fn &optional ARG)" t nil)

(autoload 'rspec-buffer-is-spec-p "rspec-mode/rspec-mode" "\
Returns true if the current buffer is a spec

\(fn)" nil nil)

(add-hook 'ruby-mode-hook (lambda nil (if (rspec-buffer-is-spec-p) (rspec-mode) (rspec-verifiable-mode))))

(add-hook 'rails-minor-mode-hook 'rspec-verifiable-mode)

;;;***

;;;### (autoloads (rvm-open-gem rvm-use rvm-activate-corresponding-ruby
;;;;;;  rvm-use-default) "rvm/rvm" "rvm/rvm.el" (20788 11765))
;;; Generated autoloads from rvm/rvm.el

(autoload 'rvm-use-default "rvm/rvm" "\
use the rvm-default ruby as the current ruby version

\(fn)" t nil)

(autoload 'rvm-activate-corresponding-ruby "rvm/rvm" "\
activate the corresponding ruby version for the file in the current buffer.
This function searches for an .rvmrc file and activates the configured ruby.
If no .rvmrc file is found, the default ruby is used insted.

\(fn)" t nil)

(autoload 'rvm-use "rvm/rvm" "\
switch the current ruby version to any ruby, which is installed with rvm

\(fn NEW-RUBY NEW-GEMSET)" t nil)

(autoload 'rvm-open-gem "rvm/rvm" "\


\(fn GEMHOME)" t nil)

;;;***

;;;### (autoloads (sass-mode) "sass-mode/sass-mode" "sass-mode/sass-mode.el"
;;;;;;  (20788 11745))
;;; Generated autoloads from sass-mode/sass-mode.el

(autoload 'sass-mode "sass-mode/sass-mode" "\
Major mode for editing Sass files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

;;;***

;;;### (autoloads (scss-mode) "scss-mode/scss-mode" "scss-mode/scss-mode.el"
;;;;;;  (20788 11746))
;;; Generated autoloads from scss-mode/scss-mode.el

(autoload 'scss-mode "scss-mode/scss-mode" "\
Major mode for editing SCSS files, http://sass-lang.com/
Special commands:
\\{scss-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;;;***

;;;### (autoloads (slim-mode) "slim-mode/slim-mode" "slim-mode/slim-mode.el"
;;;;;;  (20788 11753))
;;; Generated autoloads from slim-mode/slim-mode.el

(autoload 'slim-mode "slim-mode/slim-mode" "\
Major mode for editing Slim files.

\\{slim-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.slim\\'" . slim-mode))

;;;***

;;;### (autoloads (smex-initialize smex) "smex/smex" "smex/smex.el"
;;;;;;  (20788 11694))
;;; Generated autoloads from smex/smex.el

(autoload 'smex "smex/smex" "\


\(fn)" t nil)

(autoload 'smex-initialize "smex/smex" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (textmate-mode) "textmate/textmate" "textmate/textmate.el"
;;;;;;  (20788 11685))
;;; Generated autoloads from textmate/textmate.el

(defvar textmate-mode nil "\
Non-nil if Textmate mode is enabled.
See the command `textmate-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `textmate-mode'.")

(custom-autoload 'textmate-mode "textmate/textmate" nil)

(autoload 'textmate-mode "textmate/textmate" "\
TextMate Emulation Minor Mode

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (global-undo-tree-mode undo-tree-mode) "undo-tree/undo-tree"
;;;;;;  "undo-tree/undo-tree.el" (20788 11670))
;;; Generated autoloads from undo-tree/undo-tree.el

(autoload 'undo-tree-mode "undo-tree/undo-tree" "\
Toggle undo-tree mode.
With no argument, this command toggles the mode.
A positive prefix argument turns the mode on.
A negative prefix argument turns it off.

Undo-tree-mode replaces Emacs' standard undo feature with a more
powerful yet easier to use version, that treats the undo history
as what it is: a tree.

The following keys are available in `undo-tree-mode':

  \\{undo-tree-map}

Within the undo-tree visualizer, the following keys are available:

  \\{undo-tree-visualizer-map}

\(fn &optional ARG)" t nil)

(defvar global-undo-tree-mode nil "\
Non-nil if Global-Undo-Tree mode is enabled.
See the command `global-undo-tree-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-undo-tree-mode'.")

(custom-autoload 'global-undo-tree-mode "undo-tree/undo-tree" nil)

(autoload 'global-undo-tree-mode "undo-tree/undo-tree" "\
Toggle Undo-Tree mode in all buffers.
With prefix ARG, enable Global-Undo-Tree mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Undo-Tree mode is enabled in all buffers where
`turn-on-undo-tree-mode' would do it.
See `undo-tree-mode' for more information on Undo-Tree mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (yaml-mode yaml) "yaml-mode/yaml-mode" "yaml-mode/yaml-mode.el"
;;;;;;  (20788 11732))
;;; Generated autoloads from yaml-mode/yaml-mode.el

(let ((loads (get 'yaml 'custom-loads))) (if (member '"yaml-mode/yaml-mode" loads) nil (put 'yaml 'custom-loads (cons '"yaml-mode/yaml-mode" loads))))

(autoload 'yaml-mode "yaml-mode/yaml-mode" "\
Simple mode to edit YAML.

\\{yaml-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

;;;***

;;;### (autoloads (yas-global-mode yas-minor-mode) "yasnippet/yasnippet"
;;;;;;  "yasnippet/yasnippet.el" (20788 11728))
;;; Generated autoloads from yasnippet/yasnippet.el

(autoload 'yas-minor-mode "yasnippet/yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, `yas-expand', normally bound to
the TAB key, expands snippets of code depending on the major
mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet/yasnippet" nil)

(autoload 'yas-global-mode "yasnippet/yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("auto-complete-css/auto-complete-css.el"
;;;;;;  "auto-complete-ruby/auto-complete-ruby.el" "auto-complete-yasnippet/auto-complete-yasnippet.el"
;;;;;;  "auto-complete/auto-complete-config.el" "auto-complete/auto-complete-pkg.el"
;;;;;;  "el-get/el-get-autoloads.el" "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el" "emacs-nav/nav-dev.el"
;;;;;;  "evil/evil-commands.el" "evil/evil-common.el" "evil/evil-digraphs.el"
;;;;;;  "evil/evil-ex.el" "evil/evil-integration.el" "evil/evil-macros.el"
;;;;;;  "evil/evil-maps.el" "evil/evil-pkg.el" "evil/evil-repeat.el"
;;;;;;  "evil/evil-search.el" "evil/evil-states.el" "evil/evil-tests.el"
;;;;;;  "evil/evil-types.el" "evil/evil-vars.el" "evil/evil.el" "feature-mode/feature-mode-pkg.el"
;;;;;;  "flymake-easy/flymake-easy.el" "ido-hacks/ido-hacks.el" "inf-ruby/inf-ruby-autoloads.el"
;;;;;;  "inf-ruby/inf-ruby-pkg.el" "json/json.el" "magit/50magit.el"
;;;;;;  "magit/magit-bisect.el" "magit/magit-key-mode.el" "magit/magit-pkg.el"
;;;;;;  "popup-kill-ring/popup-kill-ring.el" "popup/popup.el" "pos-tip/pos-tip.el"
;;;;;;  "rcodetools/anything-rcodetools.el" "rcodetools/icicles-rcodetools.el"
;;;;;;  "rcodetools/rcodetools.el" "rhtml-mode/rhtml-erb.el" "rhtml-mode/rhtml-fonts.el"
;;;;;;  "rhtml-mode/rhtml-mode.el" "rhtml-mode/rhtml-navigation.el"
;;;;;;  "rhtml-mode/rhtml-ruby-hook.el" "rhtml-mode/rhtml-sgml-hacks.el"
;;;;;;  "rspec-mode/rspec-mode-expectations.el" "yasnippet/dropdown-list.el"
;;;;;;  "yasnippet/yasnippet-debug.el" "yasnippet/yasnippet-tests.el")
;;;;;;  (20788 11776 923850))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
