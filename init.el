;;; init.el --- Entry file for emacs config -*- lexical-binding: t; -*-

;;; Commentary:

;; Everything lives in config.org.  `org-babel-load-file' tangles it to
;; config.el and loads that, re-tangling only when config.org is newer.

;;; Code:

(org-babel-load-file
 (locate-user-emacs-file "config.org"))

;;; init.el ends here
