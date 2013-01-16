(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(add-hook 'ruby-mode-hook (lambda() (setq ac-sources (append '(ac-source-yasnippet) ac-sources))))
(ac-config-default)