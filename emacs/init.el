;; Reduce frequency of GC during startup
(setq gc-cons-threshold (* 50 1000 1000))

(require 'package)
(package-initialize)

(org-babel-load-file (expand-file-name "dotemacs.org" user-emacs-directory))

;; Increase frequency of GC to reduce pause times
(setq gc-cons-threshold (* 2 1000 1000))
