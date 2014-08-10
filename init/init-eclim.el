(add-hook 'java-mode-hook '(lambda ()
                             (add-hook 'after-save-hook 'eclim-problems-show-all)))

(require 'eclimd)
(setq eclimd-executable nil)
(setq eclimd-wait-for-process nil)
(setq eclimd-default-workspace "~/Projects/workspace")

(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode nil)))

(ac-config-default)
;; (require 'ac-emacs-eclim-source)
;; (ac-emacs-eclim-config)
(setq eclim-auto-save t)

(add-hook 'eclim-mode-hook 'ac-emacs-eclim-config)

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)
