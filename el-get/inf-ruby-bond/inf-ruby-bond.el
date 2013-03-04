;;; inf-ruby-bond.el --- Bond autocompletion support for inf-ruby

;; Copyright (C) 2010-2011 Kyle Hargraves

;; Authors: Kyle Hargraves <pd@krh.me>
;; URL: http://github.com/pd/inf-ruby-bond
;; Created: May 11 2010
;; Keywords: languages ruby
;; Version: 1.0

;; This file is NOT part of GNU Emacs.

;;; Installation:

;; Add this file to your load-path. (require 'inf-ruby-bond)
;; If not yet present, start Bond in your irbrc:
;;
;;   require 'bond'
;;   Bond.start

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(defun inf-ruby-bond--escape (s)
  "Escapes a string such that it will be acceptable within a single-quoted ruby string"
  (replace-regexp-in-string "'" "\\'" (or s "") nil 'literal))

(defvar inf-ruby-bond--ruby-word-break-chars
  " \t\n\"\'`><;|&{(")

(defun inf-ruby-bond--bounds-of-ruby-word-at-point ()
  (save-excursion
    (let ((end (point)))
      (skip-chars-backward (concat "^" inf-ruby-bond--ruby-word-break-chars))
      (list (point) end))))

(defun inf-ruby-bond--ruby-word-at-point ()
  (let ((bounds (inf-ruby-bond--bounds-of-ruby-word-at-point)))
    (buffer-substring (car bounds) (cadr bounds))))

(defun inf-ruby-bond-completions (word line)
  "Returns a list of bond's completions for WORD in the full line LINE.

Replaces inf-ruby-completions."
  (let* ((proc (inf-ruby-proc))
         (comint-filt (process-filter proc))
         (word (inf-ruby-bond--escape word))
         (line (inf-ruby-bond--escape line))
         (kept "")
         completions)
    (set-process-filter proc (lambda (proc string)
                               (setq kept (concat kept string))))
    (process-send-string proc (format "puts Bond.agent.call('%s', '%s')\n" word line))
    (while (not (string-match inf-ruby-prompt-pattern kept))
      (accept-process-output proc))
    (setq completions (butlast (split-string kept "[\r\n]") 2))
    (set-process-filter proc comint-filt)
    completions))

(defun inf-ruby-bond-completion-at-point ()
  (let* ((word (inf-ruby-bond--ruby-word-at-point))
         (line (thing-at-point 'line))
         (completions (inf-ruby-bond-completions word line)))
    (case (length completions)
      (0 nil)
      (1 (car completions))
      (t (completing-read "possible completions: "
                          completions nil 'confirm-only word)))))

;;;###autoload
(defun inf-ruby-bond-complete (&optional command)
  (interactive (list (inf-ruby-bond-completion-at-point)))
  (when command
    (let ((wbounds (inf-ruby-bond--bounds-of-ruby-word-at-point)))
      (kill-region (car wbounds) (cadr wbounds))
      (insert command))))

;;;###autoload
(defun inf-ruby-bond-complete-or-tab (&optional command)
  "Either complete the ruby code at point or call
`indent-for-tab-command' if no completion is available.  Relies
on Bond completion having been loaded and started, typically
from irbrc:
    require 'bond'
    Bond.start"
  (interactive (list (inf-ruby-bond-completion-at-point)))
  (if (not command)
      (call-interactively 'indent-for-tab-command)
    (inf-ruby-complete command)))

;;;###autoload
(eval-after-load 'inf-ruby
  '(define-key inf-ruby-mode-map (kbd "TAB") 'inf-ruby-bond-complete))

(provide 'inf-ruby-bond)
;;; inf-ruby-bond.el ends here
