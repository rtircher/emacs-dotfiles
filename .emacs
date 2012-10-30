(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(byte-recompile-directory "~/.emacs.d/vendor/" 0)

(add-to-list 'load-path "~/.emacs.d/vendor/haml-mode")
(require 'haml-mode)
(add-to-list 'load-path "~/.emacs.d/vendor/sass-mode")
(require 'sass-mode)

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
                      python-mode
                      puppet-mode
                      rspec-mode
                      ruby-block
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(byte-recompile-directory "~/.emacs.d/customs" 0)
(add-to-list 'load-path "~/.emacs.d/customs")

;; Turn on line numbers for every file visiteed
;; (setq linum-format "%d")
(global-linum-mode)

;; Overidding some startkit stuffs
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(menu-bar-mode t)
(delete-selection-mode t) ;; Plus it make emacs to replace the current selection when yanking
(setq shift-select-mode t)

(require 'textmate)

;; Load up customizations
(require 'rtircher-vars)
(require 'rtircher-defuns)
(require 'rtircher-bindings)
(require 'rtircher-misc)
(require 'rtircher-coffee)
(require 'rtircher-clojure)
