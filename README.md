# Al's Emacs Config

## Introduction
This config contains add-ons and enhancements to GNU Emacs. It is mostly targeted at Ruby development, but contains many good general enhancements. All of the add-on packages are managed via el-get(my personal fork which has some alternative recipes). Some of the highlights include:

 * Vim emulation enabled by default
 * Static syntax checking of Ruby, CoffeeScript, and css/scss/sass code
 * Git integration via Magit
 * Ubiquitous auto-completion
 * Easy project/file navigation via Textmate emulation
 * Code snippet insertion via Yasnippet
 * Easy directory navigation and manipulation via Emacs-nav
 * Test runner and navigation support for RSpec and Cucumber

There are 2 branches available for download. The **master** branch contains the exact configuration as I use it on my machine, including fonts, themes, etc.
The **stripped-down** branch contains the basic enhancements, but removes many of the more superfluous and less general customizations in order to give an easier jumping off point for your own customizations.

## Installation

### Basic Instructions
This configuration has only been tested with Emacs 24.

To install, simply clone this repository into ~/.emacs.d/, then launch emacs. Emacs will begin downloading and compiling the necessary packages. The initial install can take upwards of 5-10 minutes, during which time you will be unable to use emacs. Subsequent starts of Emacs should be quite fast however, usually 1-2 seconds.

#### External Programs
Some of the features included in this config require external programs to be present in your path. Emacs will still work without these programs but the selected features will not be available:

 * Ruby syntax checking
 > Requires a Ruby executable.
 > On the master branch the emacs will look for a Macruby executable, as
 > Macruby is required to properly parse Rubymotion code without errors.
 > On the stripped-down branch Emacs is configured to use a normal ruby
 > executable. In either case, the exact executable used to parse ruby can
 > be configured in _init/init-flymake-ruby.el_.

 * CoffeeScript syntax checking
 > Requires either a **coffee** or **coffeelint** executable to be available. If both
 > are present it will default to **coffeelint**.

 * Sass/Scss syntax checking
 > Requires a **sass** executable, it will automatically set the flags to check
 > whichever of the 2 syntaxes you are using.

 * CSS syntax checking
 > Requires **csslint** executable.

If you wish to install this configuration to another directory (for example if you want to share the configuration between different users of the same machine) then there are a couple of things you need to do.
 1. Create a *~/.emacs* file in every home directory where you want to load the config.
 1. Put the following line into the created file:

```lisp
 (load-file "/path/to/downloaded/init.el")
 ```

 1. Modify the following two lines in the downloaded init.el file:

```lisp
 (load-file "~/.emacs.d/user.el") => ( load-file "/path.to/downloaded/user.el" )
 (load-file "~/.emacs.d/custom.el") => ( load-file "/path.to/downloaded/custom.el" )
 ```

 And make sure that the download custom.el is writable by every user that will be using it.
 1. Modify the following three lines in the downloaded init/init-evil.el:

```lisp
 (load-file "~/.emacs.d/init/evil/evil-user-settings.el") => ( load-file "/path/to/downloaded/init/evil/evil-user-settings.el" )
 (load-file "~/.emacs.d/init/evil/evil-user-keymaps.el") => ( load-file "/path/to/downloaded/init/evil/evil-user-keymaps.el" )
 (load-file "~/.emacs.d/init/evil/evil-user-misc.el") => ( load-file "/path/to/downloaded/init/evil/evil-user-misc.el" )
```

## Keybindings
Following is a listing of many of the useful non-standard keybindings included in this config. Since this config uses evil-mode to emulate Vim's modal editing. Since "mode" has a different meaning in Emacs, we will refer to Vim-style "modes" as "states", e.g. what would be "normal mode" in Vim will be referred to as "normal state".

When discussing keybindings, it is important to note the specific modes and states to which they apply. Therefore, we will use the following notation to list keybindings:

 > _brief description_
 > Emacs-mode : _Vim state_ : **keybinding**

If either _Emacs mode_ or _Vim state_ is blank, you can assume that the keybinding works in all states/modes.

You will also see key notations in the style: _C-&lt;somekey&gt;_, _M-&lt;somekey&gt;, and s-&lt;somekey&gt;. These are standard Emacs notations for _Control_, _Meta_, and _super_. These three keys are generally bound to the Control key, Option/alt key, and Command/Windows key respectively.

### File/project navigation

_Open a directory navigation buffer (this buffer has a number of useful keybindings that you can view by pressing **?**)_
 > : **s-r**
 > _normal-state_ : **,n**

***

_Jump to file in project with fuzzy completion (Project determined by presence of source control directory, Rakefile, etc.)_
 > : **s-t**
 > _normal-state_ : **,t**

***

_Clear jump-to-file cache (needed if you add new files to the project while Emacs is open)
 > : **M-s-t**
 > _normal-state_ : **,C-t**

***

_Jump to symbol in current file_
 > : **s-T**
 > _normal-state_ : **,T**

***

_Switch to another currently open buffer_
 > _normal-state_ : **,,**

### Git

_Open Git status buffer for current repository (q to close). This status buffer serves as a kind of Git "control panel" and has many useful keybindings. For an overview see [here](http://philjackson.github.com/magit/magit.html)_
 > : **s-ESC**
 > _normal-state_ : **,gs**

***

_View the commit history for the current file (q to close)_
 > _normal-state_ : **,gh**

***

_View blame for current file inline (q to return to normal)_
 > _normal-state_ : **,gb**

***

_Do a git grep in the current project_
 > _normal-state_ : **,gg**

### Testing

_Verify test under cursor_
 > rspec-mode : : **C-c ,s**
 > feature-mode, rspec-mode : _normal-state_ : **,ss**

***

_Verify all tests in current file_
 > rspec-mode : : **C-c ,v**
 > feature-mode, rspec-mode : _normal-state_ : **,sv**

***

_Verify all tests in project_
 > rspec-mode : : **C-c ,a**
 > feature-mode, rspec-mode : _normal-state_ : **,sa**

***

_Toggle the spec under the cursor as enabled or disabled_
 > rspec-mode : _normal-state_ : **,st**

***

_Jump between a ruby file and it's spec or vice versa_
 > rspec-mode, ruby-mode : _normal-state_ : **,sg**

***

_Jump to the step definition for the step under the cursor_
 > feature-mode : _normal-state_ : **,sg**