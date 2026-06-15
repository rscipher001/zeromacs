;; No splash screen, no bell
(setq inhibit-startup-screen t
      ring-bell-function 'ignore)

(tool-bar-mode -1)
;; (menu-bar-mode 1)

(load-theme 'modus-vivendi-tinted)

;; Relative line numbers, globally
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; Highlight current line and matching parens
(global-hl-line-mode 1)
(show-paren-mode 1)

;; Scroll one line at a time, never recenter
(setq scroll-step 1
      scroll-conservatively 101)

;; Auto-pair brackets/quotes
(electric-pair-mode 1)

;; Typing replaces the active selection
(delete-selection-mode 1)

;; Spaces, not tabs
(setq-default indent-tabs-mode nil)

;; Show trailing whitespace, strip it on save
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Vertical completion in find-file, M-x, ...
(fido-vertical-mode 1)

;; Popup hints for partial key sequences
(which-key-mode 1)

;; Live docs in the echo area
(global-eldoc-mode 1)

;; Persist recent files, minibuffer history, and point-per-file
(recentf-mode 1)
(savehist-mode 1)
(save-place-mode 1)

;; y/n instead of yes/no
(setq use-short-answers t)

;; Reload buffers when the file changes on disk
(global-auto-revert-mode 1)

;; Centralise ~backups in ~/.config/zeromacs/backups/
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; No .#lockfiles
(setq create-lockfiles nil)

(use-package "meow")
(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)

  ;; Motion mode: j/k navigate, <escape> no-op
  (meow-motion-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))

  ;; Leader (SPC): digit args + help
  (meow-leader-define-key
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))

  ;; Normal mode bindings
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . ignore)))
(meow-setup)
(meow-global-mode 1)
