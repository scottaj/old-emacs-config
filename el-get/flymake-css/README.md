flymake-css.el
==============

An Emacs flymake handler for syntax-checking CSS source code
using [`csslint`](https://github.com/stubbornella/csslint).

Installation
=============

If you choose not to use one of the convenient packages in
[Melpa][melpa] and [Marmalade][marmalade], you'll need to add the
directory containing `flymake-css.el` to your `load-path`, and then
`(require 'flymake-css)`. You'll also need to install
[flymake-easy](https://github.com/purcell/flymake-easy).

Usage
=====

Add the following to your emacs init file:

    (require 'flymake-css)
    (add-hook 'css-mode-hook 'flymake-css-load)

Beware that csslint is quite slow, so there can be a significant lag
between editing and the highlighting of resulting errors.

[marmalade]: http://marmalade-repo.org
[melpa]: http://melpa.milkbox.net

<hr>

[![](http://api.coderwall.com/purcell/endorsecount.png)](http://coderwall.com/purcell)

[![](http://www.linkedin.com/img/webpromo/btn_liprofile_blue_80x15.png)](http://uk.linkedin.com/in/stevepurcell)

[Steve Purcell's blog](http://www.sanityinc.com/) // [@sanityinc on Twitter](https://twitter.com/sanityinc)

