(setq user-full-name    "Jiang Bian")
(setq user-mail-address "borderj@gmail.com")

;; 启动时的引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

(setq column-number-mode t)
(setq visible-bell t)
(fset 'yes-or-no-p 'y-or-n-p)
(display-time)
(column-number-mode t)
(transient-mark-mode t)
(show-paren-mode t)
(setq-default make-backup-files nil)

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

;; Load lisps
(add-to-list 'load-path "~/.emacs.d/lisps/") 
(add-to-list 'load-path "~/.emacs.d/php/") 

(require 'install-elisp) 
(setq install-elisp-repository-directory "~/.emacs.d/php/")


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
(require 'auto-complete)
(locate-library "auto-complete.el")

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


