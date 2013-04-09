;;; rtircher-misc.el --- Things that don't fit anywhere else

;; If emacs is started from the terminal then we use the default theme
(if (not (null window-system))
    ;; Set up my preferred color theme
    (color-theme-solarized-light)

  ;; Updating the color of the selected region because the default color is difficult to differentiate from the background for me
  (custom-set-faces
   '(region ((t (:background "#14323C"))))))

;; Adjustments to the font lock coloring. Made manually rather than
;; with custom as it provides more reliable control.
(set-face-attribute 'default
		    t
		    :family "inconsolata"
		    :height 160)

;; Set default emacs frame size
;; (add-to-list 'default-frame-alist '(height . 70))
;; (add-to-list 'default-frame-alist '(width . 200))

;; Make default shell path available to emacs
(if (not (getenv "TERM_PROGRAM"))
      (let ((path (shell-command-to-string
              "$SHELL -cl \"printf %s \\\"\\\$PATH\\\"\"")))
        (setenv "PATH" path)
        (setq exec-path (split-string path path-separator))))

;; Split window at startup
;; (split-window-horizontally)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)
(set-face-background 'show-paren-match-face (face-background 'default))
(set-face-foreground 'show-paren-match-face "cyan")

(blink-cursor-mode 1)
(line-number-mode 1)
(column-number-mode 1)

(put 'upcase-region 'disabled nil)

(custom-set-variables
 '(transient-mark-mode t)
 '(whitespace-check-leading-whitespace nil)
 '(whitespace-check-trailing-whitespace nil)
 '(whitespace-check-buffer-trailing nil)
 '(whitespace-global-mode t))
(winner-mode 1)

;; Ack config
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; (setq ispell-program-name "/usr/local/bin/aspell")

;; ;; Use markdown mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Use ruby mode for Rakefiles
(add-to-list 'auto-mode-alist '("[Rr]akefile\\'" . ruby-mode))

;; Use ruby mode for Rakefiles
(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))

;; Sass mode config
(add-hook 'sass-mode-hook
          (function (lambda ()
            (local-set-key [backspace] 'delete-backward-char)
	    (ga-tab-fix)
	    (setq tab-width 2)
	    (setq indent-tabs-mode nil)
      )))
(auto-fill-mode nil)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(remove-hook 'markdown-mode-hook #'turn-on-auto-fill)
(remove-hook 'clojure-mode-hook #'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-off-auto-fill)
(add-hook 'markdown-mode-hook 'turn-off-auto-fill)
(add-hook 'clojure-mode-hook 'turn-off-auto-fill)

;; Turns on flymake for all files which have a flymake mode
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Hippie expand config
(setq hippie-expand-try-functions-list
      '(;try-expand-list
        ;try-expand-list-all-buffers
        try-expand-all-abbrevs
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Run the emacs in-process server to accept remote-edit requests
(server-start)

(provide 'rtircher-misc)
;;; rtircher-misc.el ends here
