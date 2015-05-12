(require 'package)
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


(byte-recompile-directory "~/.emacs.d/vendor/haml-mode" 0)
(add-to-list 'load-path "~/.emacs.d/vendor/haml-mode")
(require 'haml-mode)

(byte-recompile-directory "~/.emacs.d/vendor/haml-mode" 0)
(add-to-list 'load-path "~/.emacs.d/vendor/sass-mode")
(require 'sass-mode)

(byte-recompile-directory "~/.emacs.d/vendor/jshint-mode" 0)
(add-to-list 'load-path "~/.emacs.d/vendor/jshint-mode")
(require 'flymake-jshint)

(byte-recompile-directory "~/.emacs.d/vendor/jade-mode" 0)
(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")
(require 'jade-mode)

;; (byte-recompile-file "~/.emacs.d/vendor/dirtree/tree-mode.el" 0)
;; (byte-recompile-file "~/.emacs.d/vendor/dirtree/windata.el" 0)
;; (byte-recompile-directory "~/.emacs.d/vendor/dirtree" 0)
;; (add-to-list 'load-path "~/.emacs.d/vendor/dirtree")
;; (autoload 'dirtree "dirtree" "Add directory to tree view" t)

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-js
                      starter-kit-eshell
                      color-theme
                      color-theme-solarized
                      coffee-mode
                      textmate
                      markdown-mode
                      clojure-mode
                      clojure-test-mode
                      clojure-project-mode
                      cljdoc
                      clojurescript-mode
                      clj-refactor
                      cljsbuild-mode
                      python-mode
                      puppet-mode
                      rspec-mode
                      ruby-block
                      flymake-cursor
                      flymake-sass
                      flymake-shell
                      scss-mode
                      yaml-mode
                      sws-mode
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(byte-recompile-directory "~/.emacs.d/customs" 0)
(add-to-list 'load-path "~/.emacs.d/customs")

(require 'textmate)

;; Load up customizations
(require 'rtircher-vars)
(require 'rtircher-defuns)
(require 'rtircher-bindings)
(require 'rtircher-misc)
(require 'rtircher-coffee)
(require 'rtircher-ruby)
(require 'rtircher-clojure)
