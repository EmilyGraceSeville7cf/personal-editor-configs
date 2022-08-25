;;; .emacs --- My custom .emacs config.
;;; Commentary:
;;; Installs different packages for code linting and formatting to enable user feel Emacs like an IDE.
;;; Code:

(require 'package)
(require 'lsp-mode)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(defvar emacs-themes '(spacemacs-theme) "Themes installed as packages.")
(defvar emacs-linters '(flycheck json-mode yaml-mode markdown-mode) "Code linters installed as packages.")
(defvar emacs-language-servers '(lsp-mode lsp-pyright lsp-java) "Language servers installed as packages.")
(defvar emacs-formatters '(format-all) "Code formatters installed as packages.")
(defvar emacs-other '(company) "Other packages installed as packages.")

(defvar emacs-packages (append emacs-themes emacs-linters emacs-language-servers emacs-formatters emacs-other))
(dolist (package emacs-packages)
  (package-install package))

(setq emacs-language-servers '(bash-ls csharp-ls))
(dolist (server emacs-language-servers)
  (lsp-ensure-server server))

(defvar bookmark-save-flag 1)
(menu-bar-mode -1)
(load-theme 'spacemacs-light t)
(setq-default tab-width 4)
(setq-default display-line-numbers 'relative)
(setq-default lsp-modeline-code-actions-mode '(name count))

(add-hook 'prog-mode-hook #'flycheck-mode)
(add-hook 'prog-mode-hook #'company-mode)
(add-hook 'prog-mode-hook #'format-all-mode)
(defvar emacs-hooks '(shell-mode-hook python-mode-hook java-mode-hook csharp-mode-hook c++-mode-hook))
(dolist (hook emacs-hooks)
  (add-hook hook #'lsp))

(defvar format-all-formatters '(("JSON" prettier)
								("YAML" prettier)
								("Shell" shfmt)
								("Python" black)
								("Java" clang-format)
								("C#" clang-format)
								("C++" clang-format)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(package-selected-packages
   '(spacemacs-theme lsp-java csharp-mode company lsp-pyright lsp-mode format-all yaml-mode json-mode markdown-mode flycheck)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide '.emacs)
;;; .emacs ends here
