;;
;; Basic settings
;;
(setq user-full-name "Ender Dai")
(setq user-mail-address "xdai@uoregon.edu")

;;
;; Instead of using nnimap backend to talk with IMAP server directly:
;;
;; (setq gnus-select-method
;;       '(nnimap "imap.uoregon.edu"
;;                (nnimap-stream ssl)
;;                (nnimap-server-port 993)))
;;
;; (add-to-list 'gnus-secondary-select-methods
;;             '(nnimap "mail.cs.uoregon.edu"
;;	                (nnimap-stream ssl)
;;		        (nnimap-server-port 993)))
;;
;; I prefer to let the `fetchmail' to do the job, and Gnus just need
;; to use `nnml' backend to get the mail from local spool
;;
;; We use `procmail' to split incoming mail to different groups
;; See ~/.forward and ~/.procmailrc
;;
(setq mail-sources
      '((directory :path "~/.procmail_spool/")))

(setq gnus-select-method
      '(nnml ""))

;;
;; Split mail in to several groups
;;
;; (setq nnmail-split-methods
;;      '(("Personal" "^To: xdai@uoregon.edu|^To: ender@cs.uoregon.edu")
;;	("crazy" "^Subject:.*die\\|^Organization:.*flabby")
;;	("other" "")))

;;
;; Use SMTP for out going email
;; Auth info is stored in ~/.netrc or ~/.authinfo
;; See manual page of `smtpmail' for more details
;;
(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-default-smtp-server "smtp.uoregon.edu")

;;
;; Uncomment to enable debug output
;;
;; (setq smtpmail-debug-info t)

;;
;; 72 characters per line
;;
(defun my-message-mode-setup ()
  (setq fill-column 72)
  (turn-on-auto-fill))
(add-hook 'message-mode-hook 'my-message-mode-setup)

;;
;; Always BCC myself
;;
(setq message-default-headers "Bcc: Ender Dai <xdai@uoregon.edu>\n")

;;
;; Check for new mail every 10 minutes
;;
(gnus-demon-add-handler 'gnus-group-get-new-news 10 nil)
(gnus-demon-init)

;;
;; desktop notify for new mail
;;
(require 'gnus-desktop-notify)
(gnus-desktop-notify-mode)

;;
;; disable autosave
;;
;; (setq gnus-use-dribble-file nil)


;;
;; ignore ~/.newsrc
;;
(setq gnus-save-newsrc-file nil)
(setq gnus-read-newsrc-file nil)
