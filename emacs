;;"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
;;" ModifiedBy: Jiang Bian - http://www.wifihack.net
;;" Email: borderj-AT-gmail-com
;;" Version: 1.1
;;" Last Change: 2012-08-22
;;"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

(setq user-full-name    "Jiang Bian")
(setq user-mail-address "borderj@gmail.com")

;; 启动时的引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;; 去掉Ctrl+空格
(global-set-key (kbd "C-SPC") 'nil) 

;; Linux 下 Emacs 复制内容到系统的剪切板
(setq x-select-enable-clipboard t)

;; Load lisps
(add-to-list 'load-path "~/.emacs.d/lisps/") 
(add-to-list 'load-path "~/.emacs.d/php/") 
(add-to-list 'load-path "~/.emacs.d/auto-complete/") 
(add-to-list 'load-path "~/.emacs.d/ibus/") 

(require 'install-elisp) 
(setq install-elisp-repository-directory "~/.emacs.d/php/")

;; 去掉那个大大的工具栏
(tool-bar-mode nil)  
;; 去掉菜单栏
(menu-bar-mode nil)  

(setq column-number-mode t)
(setq visible-bell t)
(fset 'yes-or-no-p 'y-or-n-p)
(display-time)
(column-number-mode t)
(transient-mark-mode t)
(show-paren-mode t)
(setq-default make-backup-files nil)
;disable backup
(setq backup-inhibited t)

;; 设置缩进
(setq c-basic-offset 4)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())
 ;; no tabs by default. modes that really need tabs should enable
 ;; indent-tabs-mode explicitly. makefile-mode already does that, for
 ;; example.
 (setq-default indent-tabs-mode nil)
 ;; if indent-tabs-mode is off, untabify before saving
 (add-hook 'write-file-hooks 
          (lambda () (if (not indent-tabs-mode)
                         (untabify (point-min) (point-max)))))


(global-set-key (kbd "C-x C-b") 'bs-show)
(iswitchb-mode 1)

;;; ### Coding ###
;;; --- 编码设置
(setq default-buffer-file-coding-system 'utf-8-unix)            ;缓存文件编码
(setq default-file-name-coding-system 'utf-8-unix)              ;文件名编码
(setq default-keyboard-coding-system 'utf-8-unix)               ;键盘输入编码
(setq default-process-coding-system '(utf-8-unix . utf-8-unix)) ;进程输出输入编码
(setq default-sendmail-coding-system 'utf-8-unix)               ;发送邮件编码
(setq default-terminal-coding-system 'utf-8-unix)               ;终端编码

;;复制剪切等文本编辑设置
(setq x-select-enable-clipboard t) ;;设置剪切板为全局
(setq mouse-drag-copy-region nil)  ;;禁止采用鼠标选取后就进入剪切板
(setq x-select-enable-primary nil)  ;; stops killing/yanking interacting with primary X11 selection
(setq select-active-regions t) ;  active region sets primary X11 selection

;; Markdown 
(autoload 'markdown-mode "markdown-mode.el"
    "Major mode for editing Markdown files" t)
(setq auto-mode-alist
    (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; Reload File
(global-set-key [f5] 'revert-buffer)
(global-set-key [C-f5] 'revert-buffer-with-coding-system)

;; ibus
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

;; tabbar
(require 'tabbar)
(tabbar-mode 1)
;; tabbar 跳转快捷键绑定
(global-set-key [(meta n)] 'tabbar-backward)
(global-set-key [(meta p)] 'tabbar-forward)


;;智能括号
(require 'autopair)                     ;;智能自动补全括号 http://www.emacswiki.org/emacs/AutoPairs
;;(require 'auto-pair+)
(autopair-global-mode 1)                ;; 全局启用智能补全括号
(require 'highlight-parentheses)        ;智能括号匹配高亮 http://www.emacswiki.org/emacs/HighlightParentheses

;;显示行号 http://www.emacswiki.org/emacs/LinumPlus
(require 'linum+)
(global-linum-mode 1);;启用全局显示行号模式
(global-set-key (kbd "C-x N") 'linum-mode)

(require 'window-number)
(autoload 'window-number-mode "window-number" t)
(autoload 'window-number-meta-mode "windows-number" t)
(window-number-mode 1)
(window-number-meta-mode 1)

;;auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

(local-set-key (kbd "M-/") 'semantic-complete-analyze-inline)
(local-set-key "." 'semantic-complete-self-insert)
(local-set-key ">" 'semantic-complete-self-insert)

;; golang mode
(require 'go-mode-load)
(require 'go-autocomplete)

;;php-mode
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;; php auto complete
(add-hook 'php-mode-hook
  (lambda ()
    (require 'php-completion)
    (php-completion-mode t)
    (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)))

(add-hook  'php-mode-hook
   (lambda ()
     (when (require 'auto-complete nil t)
       (make-variable-buffer-local 'ac-sources)
       (add-to-list 'ac-sources 'ac-source-php-completion)
       ;; if you like patial match,
       ;; use `ac-source-php-completion-patial' instead of `ac-source-php-completion'.
       (add-to-list 'ac-sources 'ac-source-php-completion-patial)
       (auto-complete-mode t))))

;; speedbar
;; (speedbar 1)
(speedbar-add-supported-extension ".go")

;; outline magic
;; how/hide parts by repeated pressing f10
(add-hook 'outline-minor-mode-hook
    (lambda ()
        (require 'outline-magic)
        (define-key outline-minor-mode-map [(f10)] 'outline-cycle)))

;; Go in Emacs using Imenu, Speedbar, and Outline mode
;; http://www.let.rug.nl/~kleiweg/go/go-emacs.html
(add-hook
 'go-mode-hook
 '(lambda ()

    ;; Imenu & Speedbar

    (setq imenu-generic-expression
          '(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
            ("func" "^func *\\(.*\\) {" 1)))
    (imenu-add-to-menubar "Index")

    ;; Outline mode

    (make-local-variable 'outline-regexp)
    (setq outline-regexp "//\\.\\|//[^\r\n\f][^\r\n\f]\\|pack\\|func\\|impo\\|cons\\|var.\\|type\\|\t\t*....")
    (outline-minor-mode 1)
    (local-set-key "\M-a" 'outline-previous-visible-heading)
    (local-set-key "\M-e" 'outline-next-visible-heading)

    ;; Menu bar

    (require 'easymenu)
    (defconst go-hooked-menu
      '("Go tools"
        ["Go run buffer" go t]
        ["Go reformat buffer" go-fmt-buffer t]
        ["Go check buffer" go-fix-buffer t]))
    (easy-menu-define
      go-added-menu
      (current-local-map)
      "Go tools"
      go-hooked-menu)

    ;; Other

    (setq tab-width 4)
    (setq show-trailing-whitespace t)

    ))

;; helper function
(defun go ()
  "run current buffer"
  (interactive)
  (compile (concat "go run " (buffer-file-name))))

;; helper function
(defun go-fmt-buffer ()
  "run gofmt on current buffer"
  (interactive)
  (if buffer-read-only
    (progn
      (ding)
      (message "Buffer is read only"))
    (let ((p (line-number-at-pos))
    (filename (buffer-file-name))
    (old-max-mini-window-height max-mini-window-height))
      (show-all)
      (if (get-buffer "*Go Reformat Errors*")
    (progn
      (delete-windows-on "*Go Reformat Errors*")
      (kill-buffer "*Go Reformat Errors*")))
      (setq max-mini-window-height 1)
      (if (= 0 (shell-command-on-region (point-min) (point-max) "gofmt" "*Go Reformat Output*" nil "*Go Reformat Errors*" t))
    (progn
      (erase-buffer)
      (insert-buffer-substring "*Go Reformat Output*")
      (goto-char (point-min))
      (forward-line (1- p)))
  (with-current-buffer "*Go Reformat Errors*"
    (progn
      (goto-char (point-min))
      (while (re-search-forward "<standard input>" nil t)
        (replace-match filename))
      (goto-char (point-min))
      (compilation-mode))))
      (setq max-mini-window-height old-max-mini-window-height)
      (delete-windows-on "*Go Reformat Output*")
      (kill-buffer "*Go Reformat Output*"))))

;; helper function
(defun go-fix-buffer ()
  "run gofix on current buffer"
  (interactive)
  (show-all)
  (shell-command-on-region (point-min) (point-max) "go tool fix -diff"))
  
