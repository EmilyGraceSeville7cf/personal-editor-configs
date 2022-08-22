;;; .emacs --- My custom .emacs config.
;;; Commentary:
;;; Installs different packages for code linting and formatting to enable user feel Emacs like an IDE.
;;; Code:

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(defvar emacs-themes '(soft-stone-theme) "Themes.")
(defvar emacs-linters '(flycheck json-mode yaml-mode markdown-mode) "Code linters.")
(defvar emacs-language-servers '(lsp-mode lsp-pyright lsp-java) "Language servers.")
(defvar emacs-formatters '(format-all) "Code formatters.")
(defvar emacs-other '(company) "Other packages.")

(defvar emacs-packages (append emacs-themes emacs-linters emacs-language-servers emacs-formatters emacs-other))
(dolist (package emacs-packages)
  (package-install package))

(defvar bookmark-save-flag 1)
(load-theme 'soft-stone t)
(add-hook 'prog-mode-hook #'flycheck-mode)
(add-hook 'prog-mode-hook #'company-mode)
(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers 'relative)
 '(package-selected-packages
   '(lsp-java csharp-mode company lsp-pyright lsp-mode format-all yaml-mode json-mode markdown-mode flycheck soft-stone-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide '.emacs)
;;; .emacs ends here
