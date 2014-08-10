(autoload 'fsharp-mode "F# mode" nil t)
(require 'fsharp-mode)
(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))
(define-key fsharp-mode-map (kbd "C-SPC") 'fsharp-ac/complete-at-point)

