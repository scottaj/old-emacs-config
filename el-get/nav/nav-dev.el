;;; nav-dev.el --- Functions to help develop nav
;;

;; Copyright 2009 Google Inc. All Rights Reserved.
;;
;; Author: issactrotts@google.com (Issac Trotts)
;;

(defun byte-compile-current-file ()
  (interactive)
  ;; Old junk stays around in the compile log, which can be confusing.
  ;; Blow it away so we only see up to date information
  (ignore-errors
    (kill-buffer "*Compile-Log*"))
  (byte-compile-file (buffer-name (current-buffer))))

(defun bc ()
  (interactive)
  (byte-compile-current-file))
