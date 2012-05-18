(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "/usr/local/bin/lein repl"))) ;; This is some crap to make it work in MacOSX since it looks like emacs doesn't find my PATH

(provide 'rtircher-clojure)
