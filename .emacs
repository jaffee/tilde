;;; .emacs ---- my custom junk
;;; Commentary:

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("2f80d6ea18d147a6b4e5b54801317b7789531c691edecfa2ab0d2972bee6b36d" "c5207e7b8cc960e08818b95c4b9a0c870d91db3eaf5959dd4eba09098b7f232b" "17c0733251014ad181c1dc614259bac5f8fb00089ccf45cb1eaae9e8c8b4952b" "246a51f19b632c27d7071877ea99805d4f8131b0ff7acb8a607d4fd1c101e163" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
 '(eclim-eclipse-dirs (quote ("~/opt/eclipse")))
 '(eclim-executable "~/opt/eclipse/eclim")
 '(flymake-gui-warnings-enabled nil)
 '(inhibit-startup-screen t)
 '(js2-dynamic-idle-timer-adjust -2)
 '(js2-highlight-level 3)
 '(js2-idle-timer-delay 0.1)
 '(js2-init-hook nil)
 '(nxml-slash-auto-complete-flag t)
 '(tab-width 4)
 '(vc-handled-backends (quote (RCS CVS SVN SCCS Bzr Hg Mtn Arch))))


;; turn off the graphical junk
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; turn on column number mode
(setq column-number-mode t)

;; show matching parens
(show-paren-mode 1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "Green"))))
 '(diff-removed ((t (:foreground "Red")))))

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;;marmalade
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; (add-to-list 'package-archives
;;     '("marmalade" .
;;       "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives
;; 	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; my custom keybindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-xm" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
;;(global-set-key (kbd "<C-tab>") 'other-window)
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

;; buffer renaming keybinding
(global-set-key "\C-cr" 'rename-buffer)

;; save hist mode ftw
(setq savehist-additional-variables    ;; also save...
  '(search-ring regexp-search-ring)    ;; ... my search entries
  savehist-file "~/.emacs.d/savehist") ;; keep my home clean
(savehist-mode t)                      ;; do customization before activate

;; go into c++ mode for CUDA .cu files
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;; in org-mode, rebind C-tab to other window instead of whatever crap org mode binds it to
(add-hook 'org-mode-hook (lambda () (local-unset-key (kbd "<C-tab>"))))
(add-hook 'org-mode-hook (lambda () (local-set-key (kbd "<C-tab>") 'other-window)))

;; ;; themage
;;(load-theme 'zenburn t) ;;emacs24

;; password caching
(setq password-cache-expiry nil)

;; default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")


  ;; get copy/paste to work with X11 stuff
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-x\C-k" 'clipboard-kill-region)
(global-set-key "\C-c\C-k" 'clipboard-kill-region)
;; (global-set-key "\C-y" 'clipboard-yank) ;; this seems to work already so I won't mess with it

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; make this only for .py files?

;; use iswitchb
(iswitchb-mode 1)

;; enable upcase-region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; expand region
(add-to-list 'load-path "~/.emacs.d/expand-region.el/")

;; python completion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-x C-/") 'magit-status)

(global-set-key (kbd "C-c a") 'align-regexp)



;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")

;;experimental
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

;; js2
;;(add-to-list 'load-path "~/.emacs.d/")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'autopair-mode)
;; (defun my-paredit-nonlisp ()
;;   "Turn on paredit mode for non-lisps."
;;   (interactive)
;;   (set (make-local-variable 'paredit-space-for-delimiter-predicates)
;;        '((lambda (endp delimiter) nil)))
;;   (paredit-mode 1))
;; (add-hook 'js-mode-hook 'my-paredit-nonlisp) ;use with the above function

;; jade mode
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'jade-mode-hook 'autopair-mode)

;; harlan
(add-to-list 'auto-mode-alist '("\\.kfc$" . scheme-mode))

;; web mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; (require 'autopair)
;; (autopair-global-mode) ;; enable autopair in all buffers
;; (setq autopair-blink t)
;; (add-hook 'term-mode-hook
;; 	  (lambda ()
;; 	      (autopair-mode -1)))

;; (require 'nrepl)

;; ;; Configure nrepl.el
;; (setq nrepl-hide-special-buffers t)
;; (setq nrepl-popup-stacktraces-in-repl t)
;; (setq nrepl-history-file "~/.emacs.d/nrepl-history")

;; Python Stuff
(add-hook 'python-mode-hook 'autopair-mode)

;; Clojure Stuff
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(setq cider-repl-history-size 100000)
(setq cider-repl-history-file "~/.nrepl/history")


;; Haskell stuff
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'paredit-mode)

;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

;; ;; Some default eldoc facilities
;; (add-hook 'nrepl-connected-hook
;; (defun pnh-clojure-mode-eldoc-hook ()
;; (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
;; (nrepl-enable-on-existing-clojure-buffers)))

;; ;; Repl mode hook
;; (add-hook 'nrepl-mode-hook 'subword-mode)

;; ;; Auto completion for NREPL
;; (require 'ac-nrepl)
;; (eval-after-load "auto-complete"
;; '(add-to-list 'ac-modes 'nrepl-mode))
;; (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)

;; Experimental
;;    rotate windows
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond
   ((not (> (count-windows) 1))
    (message "You can't rotate a single window!"))
   (t
    (let ((i 0)
          (num-windows (count-windows)))
      (while  (< i (- num-windows 1))
        (let* ((w1 (elt (window-list) i))
               (w2 (elt (window-list) (% (+ i 1) num-windows)))
               (b1 (window-buffer w1))
               (b2 (window-buffer w2))
               (s1 (window-start w1))
               (s2 (window-start w2)))
          (set-window-buffer w1 b2)
          (set-window-buffer w2 b1)
          (set-window-start w1 s2)
          (set-window-start w2 s1)
          (setq i (1+ i))))))))
(global-set-key "\C-cr" 'rotate-windows)



;; python and flymake stuff
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")



(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)



;; Ocaml junk
(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)



;; Ocaml merlin junk
;; -- merlin setup ---------------------------------------
(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'merlin)

;; Enable Merlin for ML buffers
(add-hook 'tuareg-mode-hook 'merlin-mode)

;; So you can do it on a mac, where `C-<up>` and `C-<down>` are used
;; by spaces.
(define-key merlin-mode-map
  (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
(define-key merlin-mode-map
  (kbd "C-c <down>") 'merlin-type-enclosing-go-down)
(set-face-background 'merlin-type-face "#88FF44")

;; -- enable auto-complete -------------------------------
;; Not required, but useful along with merlin-mode
(require 'auto-complete)
(add-hook 'tuareg-mode-hook 'auto-complete-mode)


;; ocaml ocp indent
(add-to-list 'load-path (concat
     (replace-regexp-in-string "\n$" ""
        (shell-command-to-string "opam config var share"))
     "/emacs/site-lisp"))
(require 'ocp-indent)

;; start server so that commands that launch editor will attach
(server-start)

;; bidi-display-reordering is incredibly computationally expensive for some reason...
;;(setq-default bidi-display-reordering nil)

(put 'set-goal-column 'disabled nil)

(load-theme 'zenburn)
(set-frame-font "DejaVu Sans Mono:pixelsize=13:foundry=unknown:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")


;; eshell
(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)
;; (global-set-key (kbd "C-c t") 'eshell)

;; (defun eshell-mode-hook-func ()
;;   (setq eshell-path-env (concat "/sbin:/home/jaffee/bin:" eshell-path-env))
;;   (setenv "PATH" (concat "/sbin:/home/jaffee/bin:" (getenv "PATH")))
;;   ) ;(define-key eshell-mode-map (kbd "M-s") 'other-window-or-split)

;; (add-hook 'eshell-mode-hook 'eshell-mode-hook-func)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location '("/home/jaffee/g2repos/policy_study/venv"))

;; multi term
;; (add-to-list 'load-path "~/.emacs.d/multi-term/")
(require 'multi-term)
(setq term-buffer-maximum-size 50000) ;; i like big buffers and I cannot lie...
(setq multi-term-program "/bin/bash")
;; (setq term-bind-key-alist '(("C-c C-c" . term-interrupt-subjob) ("C-m" . term-send-raw) ("M-o" . term-send-backspace) ("M-p" . term-send-up) ("M-n" . term-send-down) ("M-r" . term-send-reverse-search-history) ("M-," . term-send-input) ("M-." . comint-dynamic-complete))

(add-hook 'term-mode-hook (lambda ()
                             (define-key term-raw-map (kbd "C-y") 'term-paste)))
(global-set-key (kbd "C-c t") 'multi-term)
(global-set-key (kbd "C-c ]") 'multi-term-next)
(global-set-key (kbd "C-c [") 'multi-term-prev)
(global-set-key (kbd "C-c C-]") 'multi-term-next)
(global-set-key (kbd "C-c C-[") 'multi-term-prev)


(defun term-normal-mode ()
  "normal keybindings for multi-term"
  (setq term-bind-key-alist '(
			      ("C-c C-c" . term-interrupt-subjob)
			      ("C-p" . previous-line)
			      ("C-n" . next-line)
			      ("C-s" . isearch-forward)
			      ("C-r" . isearch-backward)
			      ("C-m" . term-send-raw)
			      ("M-f" . term-send-forward-word)
			      ("M-b" . term-send-backward-word)
			      ("M-o" . term-send-backspace)
			      ("M-p" . term-send-up)
			      ("M-n" . term-send-down)
			      ("M-d" . term-send-forward-kill-word)
			      ("C-w" . term-send-backward-kill-word)
			      ("M-r" . term-send-reverse-search-history)
			      ("M-," . term-send-input)
			      ("M-." . comint-dynamic-complete)
			      ("C-z" . term-stop-subjob)))
  (setq term-unbind-key-alist (append '("M-f" "M-b" "C-w") term-unbind-key-list))
  (remove-duplicates term-unbind-key-list :test 'string=)
)

(defun term-super-raw-mode ()
  "make multi-term pass all keyboard input to terminal, except one command to switch out of this mode"
  (interactive)
  (setq term-unbind-key-list '("C-M-l"))
  (setq term-bind-key-alist '())
)
(global-set-key (kbd "C-M-o") 'term-super-raw-mode)
(global-set-key (kbd "C-M-l") 'term-normal-mode)

(term-normal-mode)


(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)



(provide '.emacs)
;;; .emacs ends here
