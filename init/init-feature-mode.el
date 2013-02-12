(defadvice feature-run-cucumber (around feature-run-cucumber-around)
  "Use BASH shell for running the features because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ;; MAKE SURE RVM STUFF GETS STUCK ON THE FRONT OF THE PATH OR OSX WILL RUIN YOUR DAY
    (setenv "PATH" (concat (first (rvm--emacs-ruby-binary)) ":" (getenv "PATH")))
    ad-do-it))
(ad-activate 'feature-run-cucumber)
(setq feature-use-rvm t)
