;;; rtircher-bindings.el --- Set up some handy key bindings

;;;###autoload
(progn

  ;; (global-set-key [up] 'ignore)
  ;; (global-set-key [down] 'ignore)
  ;; (global-set-key [left] 'ignore)
  ;; (global-set-key [right] 'ignore)

  ;; Adding vim style o and O functions
  (global-set-key "\M-o" 'rtr-create-line-below)
  (global-set-key "\M-O" 'rtr-create-line-above)

  (define-key isearch-mode-map (kbd "C-x") 'ga/isearch-yank-current-word)

  ;; Text manipulation
  (global-set-key "\C-z" 'undo)
  (global-set-key "\C-x\M-k" 'duplicate-line)
  (global-set-key [delete] 'delete-char)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete

  (global-set-key "\C-x\C-z" 'ignore)

  (global-set-key "\M-]" 'rtr-indent)
  (global-set-key "\M-[" 'rtr-unindent)


  (global-set-key [\M-\S-up] 'move-text-up)
  (global-set-key [\M-\S-down] 'move-text-down)

  ;; Changing kill emacs
  (global-set-key "\C-x\C-c" 'ignore)
  (global-set-key "\C-x\C-q" 'kill-emacs)

  ;; Jump to a definition in the current file and set mark before jumping
  (global-set-key (kbd "C-x C-i") 'rtr-ido-imenu-and-mark)

  (global-set-key "\C-x\C-b" 'bs-show)

  ;; Setup window movements
  (setq windmove-wrap-around t)
  (windmove-default-keybindings 'meta)

  ;; Handy way to revert buffers
  (global-set-key "\M-r" 'revert-buffer-no-confirm)
  (global-set-key "\M-R" 'revert-all-buffers)

  ;; Font size
  (define-key global-map (kbd "C-=") 'text-scale-increase)
  (define-key global-map (kbd "C--") 'text-scale-decrease)

  (define-key global-map (kbd "M-t") 'textmate-goto-file)

  ;; It's all about the project.
  (global-set-key (kbd "C-c f") 'find-file-in-project)

  ;; You know, like Readline.
  (global-set-key (kbd "C-M-h") 'backward-kill-word)

  ;; Completion that uses many different methods to find options.
  (global-set-key (kbd "M-/") 'hippie-expand)

  ;; Perform general cleanup.
  (global-set-key (kbd "C-c n") 'esk-cleanup-buffer)

  ;; Use regex searches by default.
  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "\C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "M-%") 'query-replace-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)
  (global-set-key (kbd "C-M-%") 'query-replace)

  ;; File finding
  (global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
  (global-set-key (kbd "C-c y") 'bury-buffer)

  ;; Start eshell or switch to it if it's active.
  (global-set-key (kbd "C-x m") 'eshell)

  ;; Start a new eshell even if one is active.
  (global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

  ;; Start a regular shell if you prefer that.
  (global-set-key (kbd "C-x C-m") 'shell)

  ;; If you want to be able to M-x without meta (phones, etc)
  (global-set-key (kbd "C-c x") 'execute-extended-command)

  ;; Help should search more than just commands
  (define-key 'help-command "a" 'apropos)

  ;; Should be able to eval-and-replace anywhere.
  (global-set-key (kbd "C-c e") 'esk-eval-and-replace)

  ;; M-S-6 is awkward
  (global-set-key (kbd "C-c q") 'join-line)

  ;; So good!
  (global-set-key (kbd "C-c g") 'magit-status)

  ;; This is a little hacky since VC doesn't support git add internally
  (eval-after-load 'vc
    (define-key vc-prefix-map "i"
      '(lambda () (interactive)
         (if (not (eq 'Git (vc-backend buffer-file-name)))
             (vc-register)
           (shell-command (format "git add %s" buffer-file-name))
           (message "Staged changes.")))))

  ;; Activate occur easily inside isearch
  (define-key isearch-mode-map (kbd "C-o")
    (lambda () (interactive)
      (let ((case-fold-search isearch-case-fold-search))
        (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))))



(provide 'rtircher-bindings)
