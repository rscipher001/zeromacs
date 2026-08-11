;;; early-init.el --- Runs before the first frame exists -*- lexical-binding: t; -*-

;;; Commentary:

;; Emacs 27+ loads this before init.el, before package.el is activated, and
;; crucially before the initial frame is created.  Anything that changes how
;; the frame is built belongs here; anything else belongs in config.org.

;;; Code:

;; The UI bars are switched off in config.org with (tool-bar-mode -1) and
;; friends, but that runs after the frame has already been built with them, so
;; you see them appear and then vanish.  Setting the frame parameters here
;; means the frame is never built with them in the first place.  The mode calls
;; in config.org stay as documentation; they become no-ops.
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Don't let a font or tool-bar change resize the frame during startup; each
;; implied resize is a round trip to the window manager.
(setq frame-inhibit-implied-resize t)

;; Garbage collection during startup is close to pure waste: the whole point of
;; init is to allocate structures that then live for the session.  Turn the
;; collector off for the duration and restore a sane threshold afterwards.
;; Without the restore, Emacs would never collect and would grow without bound.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(defun my/restore-gc-settings ()
  "Return the garbage collector to normal after startup."
  (setq gc-cons-threshold (* 32 1024 1024)
        gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook #'my/restore-gc-settings)

;;; early-init.el ends here
