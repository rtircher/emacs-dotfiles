(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "/usr/local/bin/lein repl"))) ;; This is some crap to make it work in MacOSX since it looks like emacs doesn't find my PATH

(defun rtr-clojure-test-maybe-enable nil
  "Enable clojure-test-mode if the current buffer contains \"clojure.test\" package."
  (let ((ns (clojure-find-package)))
    (when (search "-test" ns)
      (save-window-excursion (clojure-test-mode t)))))

(add-hook 'clojure-mode-hook 'rtr-clojure-test-maybe-enable)

(require 'clojure-mode)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(provide 'rtircher-clojure)
