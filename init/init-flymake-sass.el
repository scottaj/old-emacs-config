(add-hook 'sass-mode-hook 'rvm-activate-corresponding-ruby)
(add-hook 'scss-mode-hook 'rvm-activate-corresponding-ruby)

(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'scss-mode-hook 'flymake-sass-load)