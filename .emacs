(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-js starter-kit-eshell color-theme-solarized sass-mode coffee-mode js2-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(add-to-list 'load-path "~/.emacs.d")

;; Turn on line numbers for every file visiteed
;; (setq linum-format "%d")
(global-linum-mode)

;; Overidding some startkit stuffs
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(menu-bar-mode t)
(delete-selection-mode t) ;; Plus it ake emacs to replace the current selection when yanking
(setq shift-select-mode t)


;; Load up customizations
(require 'rtircher-vars)
(require 'rtircher-defuns)
(require 'rtircher-bindings)
(require 'rtircher-misc)
