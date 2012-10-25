;;; rtircher-defuns.el --- Define some custom functions

(defun activate-arrows (&optional args)
  "Activate/disactivate the arrow for text navigation"
  (interactive)
  (global-set-key [up] 'previous-line)
  (global-set-key [down] 'next-line)
  (global-set-key [left] 'left-char)
  (global-set-key [right] 'right-char))

(defun save-buffer-if-visiting-file (&optional args)
  "Save the current buffer only if it is visiting a file"
  (interactive)
  (if (and (buffer-file-name) (buffer-modified-p))
      (save-buffer args)))
;; (add-hook 'auto-save-hook 'save-buffer-if-visiting-file)
;; (remove-hook 'auto-save-hook 'save-buffer-if-visiting-file)
;; And run auto-save frequently enough to be interesting
;; (setq auto-save-interval 1)

;; Create vim like o and O functions that create a new line below or above the current line (even from the middle of a line)
(defun rtr-create-line-below ()
  "Creates a new line below the current line"
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline))

(defun rtr-create-line-above ()
  "Creates a new line below the current line"
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1))

;; setting mark before calling imenu
(defvar push-mark-before-goto-char nil)

(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))

(defun rtr-ido-imenu-and-mark ()
  (interactive)
  (let ((push-mark-before-goto-char t))
    (ido-imenu)))

;; Improved searching:
(defun ga/isearch-yank-current-word ()
  "Pull current word from buffer into search string."
  (interactive)
  (save-excursion
    (skip-syntax-backward "w_")
    (isearch-yank-internal
     (lambda ()
       (skip-syntax-forward "w_")
       (point)))))

;; Make the TAB key indent if at the beginning of a line, or perform an expansion
;; everywhere else
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))
(defun ga-tab-fix ()
  (local-set-key [tab] 'indent-or-expand))

(defun duplicate-line ()
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (open-line 1)
    (next-line 1)
    (yank)))

;; binding keys to revert buffers
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
	(revert-buffer t t t) )))
  (message "Refreshed open files.") )

(defun remove-string-from-buffer (str)
  "Removes all occurences of the string STR from the current buffer."
  (interactive "MRemove string: ")
  (save-excursion
    (goto-char (point-min))
    (replace-string str "")))

(defun ido-imenu ()
  "Update the imenu index and then use ido to select a symbol to navigate to.
Symbols matching the text at point are put first in the completion list."
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
	(symbol-names '()))
    (flet ((addsymbols (symbol-list)
		       (when (listp symbol-list)
			 (dolist (symbol symbol-list)
			   (let ((name nil) (position nil))
			     (cond
			      ((and (listp symbol) (imenu--subalist-p symbol))
			       (addsymbols symbol))

			      ((listp symbol)
			       (setq name (car symbol))
			       (setq position (cdr symbol)))

			      ((stringp symbol)
			       (setq name symbol)
			       (setq position (get-text-property 1 'org-imenu-marker symbol))))

			     (unless (or (null position) (null name))
			       (add-to-list 'symbol-names name)
			       (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    ;; If there are matching symbols at point, put them at the beginning of `symbol-names'.
    (let ((symbol-at-point (thing-at-point 'symbol)))
      (when symbol-at-point
	(let* ((regexp (concat (regexp-quote symbol-at-point) "$"))
	       (matching-symbols (delq nil (mapcar (lambda (symbol)
						     (if (string-match regexp symbol) symbol))
						   symbol-names))))
	  (when matching-symbols
	    (sort matching-symbols (lambda (a b) (> (length a) (length b))))
	    (mapc (lambda (symbol) (setq symbol-names (cons symbol (delete symbol symbol-names))))
		  matching-symbols)))))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
	   (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))


(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (beginning-of-line)
    (when (or (> arg 0) (not (bobp)))
      (forward-line)
      (when (or (< arg 0) (not (eobp)))
        (transpose-lines arg))
      (forward-line -1)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))


(provide 'rtircher-defuns)
;;; rtircher-defuns.el ends here
