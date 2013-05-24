;;; .emacs ---- my custom junk
;;; Commentary:

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
 '(inhibit-startup-screen t)
 '(vc-handled-backends (quote (RCS CVS SVN SCCS Bzr Hg Mtn Arch))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "Green"))))
 '(diff-removed ((t (:foreground "Red")))))

;; my custom keybindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-xm" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key (kbd "<C-tab>") 'other-window)
(defun back-window ()
  "Make the window go back."
  (interactive)
  (other-window -1))
(global-set-key (kbd "<C-S-iso-lefttab>") 'back-window)

  ;;make default C-e behavior end of line instead of end of visual line
(global-set-key (kbd "<C-e>") 'end-of-line)
  ;;bindings for comment and uncomment region
(global-set-key "\C-c/" 'comment-region)
(global-set-key "\C-c\\" 'uncomment-region)

(global-set-key "\C-cb" 'bury-buffer)

;;need to make sure this doesn't stomp on anything
(global-set-key "\C-c " 'fixup-whitespace)

(global-set-key "\C-cr" 'rename-buffer)

;; in org-mode, rebind C-tab to other window instead of whatever crap org mode binds it to
;; rebind C-j to backward char like i like it, and move org-return-indent to C-b
;; (add-hook 'org-mode-hook (lambda () (local-unset-key "\C-j")))
;; (add-hook 'org-mode-hook (lambda () (local-set-key "\C-j" 'backward-char)))
(add-hook 'org-mode-hook (lambda () (local-unset-key (kbd "<C-tab>"))))
(add-hook 'org-mode-hook (lambda () (local-set-key (kbd "<C-tab>") 'other-window)))
;; (add-hook 'org-mode-hook (lambda () (local-set-key (kbd "<C-b>") 'org-return-indent)))


;; ;; themage
(load-theme 'zenburn t) ;;emacs24
;; (require 'color-theme)
;; (load-file "~/.emacs.d/themes/zenburn.el")
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-zenburn)))
;; (setq term-default-bg-color (cdr (assoc 'background-color default-frame-alist)))
;;(set-foreground-color "#AFAFAF")
;;(set-background-color "#000000")


;; password caching
(setq password-cache-expiry nil)


;; default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")


  ;; get copy/paste to work with X11 stuff
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-x\C-k" 'clipboard-kill-region)
(global-set-key "\C-c\C-k" 'clipboard-kill-region)
;; (global-set-key "\C-y" 'clipboard-yank) ;; this seems to work already so I won't mess with it

;; mode compile
(autoload 'mode-compile "/home/jaffee/.emacs.d/mode-compile.el"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)
;; turn off the graphical junk
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; python stuff
(defun python-compile ()
  "Use compile to run python programs."
  (interactive)
  (compile (concat "python " (buffer-name))))
(setq compilation-scroll-output t)
(global-set-key "" (quote python-compile))

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; make this only for .py files?


(add-hook 'after-init-hook #'global-flycheck-mode)
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))

;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;; ;; wanderlust
;; (autoload 'wl "wl" "Wanderlust" t)
;; (autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
;; (autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; ;; IMAP
;; (setq elmo-imap4-default-server "imap.gmail.com")
;; (setq elmo-imap4-default-user "matthew.jaffee@gmail.com")
;; (setq elmo-imap4-default-authenticate-type 'clear)
;; (setq elmo-imap4-default-port '993)
;; (setq elmo-imap4-default-stream-type 'ssl)

;; (setq elmo-imap4-use-modified-utf7 t)

;; ;; SMTP
;; (setq wl-smtp-connection-type 'starttls)
;; (setq wl-smtp-posting-port 587)
;; (setq wl-smtp-authenticate-type "plain")
;; (setq wl-smtp-posting-user "matthew.jaffee")
;; (setq wl-smtp-posting-server "smtp.gmail.com")
;; (setq wl-local-domain "gmail.com")

;; (setq wl-default-folder "%INBOX")
;; (setq wl-default-spec "%")
;; (setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
;; (setq wl-trash-folder "%[Gmail]/Trash")

;; (setq wl-folder-check-async t)

;; (setq wl-from "Matthew Jaffee <matthew.jaffee@gmail.com>")

;; (setq elmo-imap4-use-modified-utf7 t)

;; (autoload 'wl-user-agent-compose "wl-draft" nil t)
;; (if (boundp 'mail-user-agent)
;;     (setq mail-user-agent 'wl-user-agent))
;; (if (fboundp 'define-mail-user-agent)
;;     (define-mail-user-agent
;;       'wl-user-agent
;;       'wl-user-agent-compose
;;       'wl-draft-send
;;       'wl-draft-kill
;;       'mail-send-hook))

;; cedet stuff
;;(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
;;(global-ede-mode 1)                      ; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu


;; SML stuff
(fset 'reload-sml-repl
   [?\C-c ?\C-s return ?\C-c ?\C-s return ?\M-r ?u ?s ?e return return return])
(global-set-key (kbd "C-x C-'") 'reload-sml-repl)


;; jabber stuff
(setq jabber-account-list
      '(("jaffee@damsl.soic.indiana.edu")
	("matthew.jaffee@gmail.com"
	 (:network-server . "talk.google.com")
	 (:port . 5223)
	 (:connection-type . ssl))
	;; ("mjaffee@jabber.grnoc.iu.edu"
	;;  (:port . 5223)
	;;  (:connection-type . ssl))
	))
;; (setq jabber-xosd-display-time 5)

;; (defun jabber-xosd-display-message (message)
;;   "Displays MESSAGE through the xosd"
;;   (let ((process-connection-type nil))
;;     (start-process "jabber-xosd" nil "osd_cat" "-p" "bottom" "-A" "center" "-f" "-*-courier-*-*-*-*-30" "-d" (number-to-string jabber-xosd-display-time))
;;     (process-send-string "jabber-xosd" message)
;;     (process-send-eof "jabber-xosd")))

;; (defun jabber-message-xosd (from buffer text propsed-alert)
;;   (jabber-xosd-display-message "New message."))

(defun jabber-play-sound (a b c d)
  "Play a sound for an incoming jabber message.  A B C D are args."
  (start-process "playsound" nil "play" "~/.emacs.d/jabbersounds/Receive.aif"))


(add-hook 'jabber-alert-message-hooks 'jabber-play-sound)

(setq jabber-auto-reconnect t)
(setq jabber-history-enabled t)
(setq jabber-backlog-number 100000)
(setq jabber-backlog-days 100000)
(setq jabber-alert-presence-hooks '())
;; ;;  '(jabber-avatar-verbose nil)
;; ;;  '(jabber-vcard-avatars-retrieve nil)
;; ;;  '(jabber-chat-buffer-format "*-jabber-%n-*")
;; ;;  '(jabber-mode-line-mode t)
;; ;;  '(jabber-roster-buffer "*-jabber-*")
(setq jabber-roster-line-format " %c %-25n %u %-8s (%r)")
(setq jabber-show-offline-contacts nil)

;; expand region
(add-to-list 'load-path "~/.emacs.d/expand-region.el/")
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; use iswitchb
(iswitchb-mode 1)

;; egg (git stuff)
;; (add-to-list 'load-path "~/.emacs.d/bogolisk-egg-d0b62d9")
;; (require 'egg)

;; buff menu +
;;(load-file "~/.emacs.d/buff-menu+.el")

;; enable upcase-region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; multi term
(add-to-list 'load-path "~/.emacs.d/multi-term/")
(require 'multi-term)
(setq term-buffer-maximum-size 50000) ;; i like big buffers and I cannot lie...
(setq multi-term-program "/usr/bin/zsh")
(add-to-list 'term-bind-key-alist '("M-d" . term-send-forward-kill-word))
(add-to-list 'term-bind-key-alist '("C-w" . term-send-backward-kill-word))
(setq term-unbind-key-list (remove "C-z" term-unbind-key-list))
(add-to-list 'term-bind-key-alist '("C-z" . term-stop-subjob))
;; (setq add-to-unbind '("M-f" "M-b" "C-f" "C-b" "C-a" "C-e" "C-w"))
;;(setq term-unbind-key-list (append add-to-unbind term-unbind-key-list))
;; (remove-duplicates term-unbind-key-list :test 'string=)
;; (setq term-bind-key-alist '(("C-c C-c" . term-interrupt-subjob) ("C-m" . term-send-raw) ("M-o" . term-send-backspace) ("M-p" . term-send-up) ("M-n" . term-send-down) ("M-r" . term-send-reverse-search-history) ("M-," . term-send-input) ("M-." . comint-dynamic-complete)))
(add-hook 'term-mode-hook (lambda ()
                            (define-key term-raw-map (kbd "C-y") 'term-paste)))
(global-set-key (kbd "C-c t") 'multi-term)
(global-set-key (kbd "C-c ]") 'multi-term-next)
(global-set-key (kbd "C-c [") 'multi-term-prev)
(global-set-key (kbd "C-c C-]") 'multi-term-next)
(global-set-key (kbd "C-c C-[") 'multi-term-prev)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")

  ;;experimental
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))


;; dirtrack
;; (require 'dirtrack)
;; (add-hook 'shell-mode-hook
;;  	  (lambda ()
;;  	    (shell-dirtrack-mode nil)
;;    	    (dirtrack-mode 1)
;; 	    (setq dirtrack-list '("^[^/]*hikerbear[^/]*\\(/[A-Za-z0-9-_/ ]*\\)" 1))))

;; o-blog
;; (add-to-list 'load-path "~/.emacs.d/o-blog")
;; (require 'o-blog)

;; js2
(add-to-list 'load-path "~/.emacs.d/")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
(setq autopair-blink t)
(add-hook 'term-mode-hook
	  (lambda ()
	      (autopair-mode -1)))



;; start server so that commands that launch editor will attach
(server-start)

;;marmalade
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; bidi-display-reordering is incredibly computationally expensive for some reason...
(setq-default bidi-display-reordering nil)

(provide '.emacs)
;;; .emacs ends here
