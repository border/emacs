;; To use graphviz-dot-mode
(load-file "~/.emacs.d/lisps/graphviz-dot-mode.el")

(add-to-list 'load-path "~/.emacs.d/php/") 
(require 'install-elisp) 
(setq install-elisp-repository-directory "~/.emacs.d/php/")


;;auto-complete
(require 'auto-complete)
(locate-library "auto-complete.el")

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


