;; Use ruby mode for Rakefiles
(add-to-list 'auto-mode-alist '("[Rr]akefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Rr]ake\\'" . ruby-mode))
;; Use ruby mode for Gemfiles
(add-to-list 'auto-mode-alist '("[Gg]emfile\\'" . ruby-mode))
;; Use ruby mode for Vagrantfiles
(add-to-list 'auto-mode-alist '("[Vv]agrantfile\\'" . ruby-mode))
;; Use ruby mode for Guardfiles
(add-to-list 'auto-mode-alist '("[Gg]uardfile\\'" . ruby-mode))
;; Use ruby mode for prawn files
(add-to-list 'auto-mode-alist '("\\.prawn\\'" . ruby-mode))

(provide 'rtircher-ruby)
