;;; rtircher-misc.el --- Things that don't fit anywhere else

;; Set up my preferred color theme
(color-theme-solarized-dark)

;; Updating the color of the selected region because the default color is difficult to differentiate from the background for me
(custom-set-faces
  '(region ((t (:background "#14323C")))))

;; Adjustments to the font lock coloring. Made manually rather than
;; with custom as it provides more reliable control.
(set-face-attribute 'default
		    t
		    :family "inconsolata"
		    :height 140)

(setenv "PATH" (concat "/usr/local/bin" path-separator (getenv "PATH")))

;; Set default emacs frame size
;; (add-to-list 'default-frame-alist '(height . 70))
;; (add-to-list 'default-frame-alist '(width . 200))

;; (setq mac-option-key-is-meta nil)
;; (setq mac-command-key-is-meta t)
;; (setq mac-command-modifier 'meta)
;; (setq mac-option-modifier nil)

;; Make current path available to emacs
(setenv "PATH" (shell-command-to-string "echo $PATH"))

;; Split window at startup
(split-window-horizontally)

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

(setq ispell-program-name "/usr/local/bin/aspell")

;; ;; Use markdown mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Sass mode config
(add-hook 'sass-mode-hook
          (function (lambda ()
            (local-set-key [backspace] 'delete-backward-char)
	    (ga-tab-fix)
	    (setq tab-width 2)
	    (setq indent-tabs-mode nil)
            )))

;; Run the emacs in-process server to accept remote-edit requests
(server-start)

(provide 'rtircher-misc)
;;; rtircher-misc.el ends here
