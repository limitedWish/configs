;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; fontset setting
;;(set-fontset-font "fontset-startup" nil "Bitstream Vera Sans Mono 8")

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;; Emacs load path
(setq load-path (cons "~/.emacs.d/lisp" load-path))

;; show vi-style line number in all buffers
;; (global-linum-mode)

;; turn off toolbar
(tool-bar-mode 0)

;; show column number
(column-number-mode t)

(require 'psvn)

(require 'xcscope)

(require 'session) 
(add-hook 'after-init-hook 'session-initialize)

; run M-x desktop-save for the first time use this plugin
(desktop-save-mode 1)

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

(setq eshell-prompt-function
      (lambda ()
	(concat "\n"
		(getenv "USER") "@"
		(getenv "HOSTNAME") ":"
		(eshell/pwd) "\n"
		(if (= (user-uid) 0) "# " "$ "))))
(setq eshell-prompt-regexp
      (concat "^"
	      (if (= (user-uid) 0)
		  (regexp-quote "# ")
		(regexp-quote "$ "))))

(setq dired-listing-switches "-l")

;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-robin-hood)

;; cc-mode config
(setq c-default-style
      '((java-mode . "java")
	(other . "linux")))
(setq c-basic-offset 4)

;; enable which-func-mode for cc-mode
;(add-hook 'c-mode-common-hook
;	  (lambda ()
;	    (which-func-mode)))

;; don't display splash screen
(setq inhibit-splash-screen t)

;; ChangeLog config
(setq add-log-full-name "Ender.Dai")
;;(setq add-log-mailing-address "ender.dai@sun.com") ;; OH MY BEST MEMORIES....
(setq add-log-mailing-address "xdai@uoregon.edu")    ;; NEW LIFE IN US OF A

;; misc key bindings
(defun scroll-up-1 ()
  "Scroll up 1 line."
  (interactive)
  (scroll-up 1))
(global-set-key (kbd "C-,") 'scroll-up-1)

(defun scroll-down-1 ()
  "Scroll down 1 line."
  (interactive)
  (scroll-down 1))
(global-set-key (kbd "C-.") 'scroll-down-1)

;; "F12" for the simple calculator
(global-set-key [f12] 'calculator)

;; calendar && diary
(setq diary-file "~/.emacs.d/diary")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

(put 'set-goal-column 'disabled nil)

(put 'narrow-to-region 'disabled nil)

;(server-start)
