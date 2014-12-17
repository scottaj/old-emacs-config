(require 'neotree)

(defun shell-cmd (command)
  "Runs a shell command and then refreshes the Nav window."
	(interactive "sShell command: ")
	(neotree-refresh))

(defun neotree-delete ()
	"Delete and refresh"
	(interactive)
	(neotree-delete-node)
	(neotree-refresh))

(defun neotree-rename ()
	"Rename and refresh"
	(interactive)
	(neotree-rename-node)
	(neotree-refresh))

(define-key neotree-mode-map (kbd "a") 'ack)
(define-key neotree-mode-map (kbd "!") 'shell-cmd)
(define-key neotree-mode-map (kbd "m") 'neotree-rename)
(define-key neotree-mode-map (kbd "k") 'neotree-delete)
(define-key neotree-mode-map (kbd "n") 'neotree-create-node)
(define-key neotree-mode-map (kbd ".") 'neotree-hidden-file-toggle)
