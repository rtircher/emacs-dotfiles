(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "/usr/local/bin/lein repl"))) ;; This is some crap to make it work in MacOSX since it looks like emacs doesn't find my PATH

(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)
;; Make C-c C-z switch to the *nrepl* buffer in the current window
(add-to-list 'same-window-buffer-names "*nrepl*")

(defun rtr-clojure-test-maybe-enable nil
  "Enable clojure-test-mode if the current buffer contains \"clojure.test\" package."
  (let ((ns (clojure-find-package)))
    (when (search "-test" ns)
      (save-window-excursion (clojure-test-mode t)))))

(add-hook 'clojure-mode-hook 'rtr-clojure-test-maybe-enable)

(require 'clojure-mode)

;; how to use define-clojure-indent:
;; * `defun', meaning indent `defun'-style;
;; * an integer N, meaning indent the first N arguments specially
;;   like ordinary function arguments and then indent any further
;;   arguments like a body;
;; * a function to call just as this function was called.
;;   If that function returns nil, that means it doesn't specify
;;   the indentation.

;; Indent for compojure
(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

;;Indent for speclj
(define-clojure-indent
  (describe 'defun)
  (it 'defun)
  (xit 'defun)
  (context 'defun)
  (should 0)
  (should= 0)
  (should-not 0)
  (should-not= 0)
  (should-fail 0)
  (should-throw 0)
  (should-not-throw 0)
  (before 0)
  (before-all 0)
  (after 0)
  (after-all 0)
  (with 0)
  (with-all 0)
  (around 2)
  (tags 0))

(provide 'rtircher-clojure)
