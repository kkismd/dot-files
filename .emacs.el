
;;; key assign
(define-key global-map [8] 'delete-backward-char)
(define-key global-map "\M-?" 'help-command)
(define-key ctl-x-map  "\C-b" 'buffer-menu)
;;(define-key global-map "\C-?/" 'advertised-undo) ; unusable in Mac

(define-key global-map "\M-g" 'goto-line)

(add-hook 'view-mode-hook
          (lambda ()
            (define-key view-mode-map  "b" 'View-scroll-page-backward)
            (define-key view-mode-map  "j" 'View-scroll-line-forward)
            (define-key view-mode-map  "k" 'View-scroll-line-backward)))

;;; window
(if window-system
    (progn
      (setq initial-frame-alist '((width . 105)
                                  (height . 55)
                                  (left . 110)
                                  (top . 0)))
      (set-background-color "whitesmoke")
      (set-foreground-color "Black")
;;       (set-background-color "Black")
;;       (set-foreground-color "whitesmoke")
      (set-cursor-color "darkslategray")
      (blink-cursor-mode nil)
      (setq-default line-spacing 1)
      (mac-set-input-method-parameter 'japanese 'cursor-color "darkred")
      (mac-set-input-method-parameter 'roman 'cursor-color "darkslategray")
      (mac-add-ignore-shortcut '(control))))

;;; Language
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(menu-bar-mode t)
(tool-bar-mode nil)
(setq display-time-24hr-format t) ;; default nil ex. 8:08am
(display-time)
(transient-mark-mode t)
(put 'narrow-to-region 'disabled nil)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)
(setq inhibit-startup-screen t)
(line-number-mode t)
(column-number-mode t)


;;; load-path
(setq load-path (add-to-list 'load-path (expand-file-name "~/elisp")))

;;; font
;; 1234567890
;; あいうえお
(if window-system
    (progn
      (require 'carbon-font)
      (fixed-width-set-fontset "hiramaru" 14)
      (setq-default line-spacing 0.0)
      (setq mac-allow-anti-aliasing t)))

;; ; Andale Mono
;; (setq carbon-font-encode-family-list-andale
;;       '((ascii . "Andale Mono")
;;         (japanese-jisx0208 . "hiragino maru gothic pro")
;;         (katakana-jisx0201 . "hiragino maru gothic pro")
;;         (thai-tis620 . "ayuthaya")
;;         (chinese-gb2312 . "stheiti*")
;;         (chinese-big5-1 . "lihei pro*")
;;         (korean-ksc5601 . "applegothic*")))

;; (carbon-font-create-fontset "Andale Mono"
;;                             carbon-font-defined-sizes
;;                             carbon-font-encode-family-list-andale)


;;; elscreen
(require 'elscreen)
(require 'elscreen-dnd)
(require 'elscreen-dired)
(require 'elscreen-gf)
(require 'elscreen-speedbar)

;; バッファと同時にスクリーンもkillする
(defun kill-buffer/screen ()
  (interactive)
  (kill-buffer nil)
  (unless (elscreen-one-screen-p)
      (elscreen-kill)))

(define-key elscreen-map  "\C-z" 'kill-buffer/screen)
;(define-key global-map "\C-xk" 'kill-buffer/screen)
;(define-key global-map "\C-x\C-k" 'kill-buffer/screen)

;;; タブ移動をMac風に変更
(define-key global-map "\M-}" 'elscreen-next)
(define-key global-map "\M-{" 'elscreen-previous)

;; diredとバッティングするので調整
(add-hook 'dired-load-hook
          (lambda ()
            (define-key dired-mode-map "\M-}" 'elscreen-next)
            (define-key dired-mode-map "\M-{" 'elscreen-previous)))

(show-paren-mode)
;; マッチする括弧の中をボールドに
;; (setq show-paren-style 'expression)
;; (set-face-background 'show-paren-match-face "white")
;; (set-face-bold-p 'show-paren-match-face t)

;;; dsvn.el
;(autoload 'svn-status "dsvn" "Run `svn status'." t)
;(autoload 'svn-update "dsvn" "Run `svn update'." t)

;;; font-lock
(global-font-lock-mode t)

;;; Diredでファイル名の書き換え
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;; howm
(setq howm-directory (expand-file-name "~/Dropbox/howm/"))
(require 'howm)
(require 'elscreen-howm)
(setq howm-view-summary-persistent nil)

;;; calendarから日付を入力
(eval-after-load "calendar"
  '(progn
     (define-key calendar-mode-map
       "\C-m" 'my-insert-day)
     (defun my-insert-day ()
       (interactive)
       (let* ((calendar-date-display-form
               '("[" year "-" (format "%02d" (string-to-int month))
                 "-" (format "%02d" (string-to-int day)) "]"))
              (day (calendar-date-string
                    (calendar-cursor-to-date t))))
         (exit-calendar)
         (insert day)))))

;;; 罫線を引く
(define-key howm-mode-map "\C-c-" 'my-insert-k)
(defun my-insert-k ()
  (interactive)
  (insert "----------------------------------------------------------------------------------------\n"))

;;; Ruby
(require 'ruby-mode)
(require 'ruby-electric)
(add-hook 'ruby-mode-hook
          (lambda ()
            (ruby-electric-mode)))

;(setq ruby-use-encoding-map nil)
(setq ruby-insert-encoding-magic-comment t)

;; speedbar
(require 'speedbar)
(speedbar-add-supported-extension (list ".rb" ".erb" ".yml" ".js"))

;;; dmacro.el
;; http://pitecan.com/DynamicMacro/
(defconst *dmacro-key* "\C-^" "繰返し指定キー")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)

;; Interactively Do Things
;; (require 'ido)
;; (ido-mode t)

;;; Rinari
(setq load-path (cons (expand-file-name "~/src/Elisp/rinari/") load-path))
(require 'rinari)
;; rhtml
(setq load-path (cons (expand-file-name "~/src/Elisp/rhtml/") load-path))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))

;;; emacsclient
(server-start)

;;; anything
(require 'anything-config)
(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-bookmarks
                             anything-c-source-recentf
                             anything-c-source-file-name-history
                             anything-c-source-locate))
(define-key anything-map "\C-p" 'anything-previous-line)
(define-key anything-map "\C-n" 'anything-next-line)
(define-key anything-map "\C-v" 'anything-next-source)
(define-key anything-map "\M-v" 'anything-previous-source)
(global-set-key [f2] 'anything)

;;; yasnippets
(require 'yasnippet-bundle)
(yas/load-directory "~/elisp/rails-snippets")

;; (require 'advice)
;; (defadvice compile-goto-error  (around elscreen-dired-find-file-other-window activate)
;;   (let ((window-configuration (current-window-configuration))
;; 	(buffer nil))
;;     ad-do-it
;;     (unless (eq major-mode 'grep-mode)
;;       (setq buffer (current-buffer))
;;       (set-window-configuration window-configuration)
;;       (elscreen-find-and-goto-by-buffer buffer t))))

;;; js2-mode
(setq-default c-basic-offset 2)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


