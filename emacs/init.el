(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(org-babel-load-file (expand-file-name "~/workspace/emacs/settings.org"))
;; Enable company in all buffers
;; (add-hook 'after-init-hook 'global-company-mode)

;; All the icons
(use-package all-the-icons 
  :config (setq inhibit-compacting-font-caches t))
; (use-package all-the-icons)

;;; DO NOT CHANGE BELOW --- emacs generated code -- DO NOT CHANGE
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-medium))
 '(custom-safe-themes
   '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "8d5f22f7dfd3b2e4fc2f2da46ee71065a9474d0ac726b98f647bc3c7e39f2819" default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(auto-complete merlin smartparens gruvbox-theme windresize evil ido org powerline smart-mode-line swiper ivy use-package tuareg smart-mode-line-powerline-theme projectile org-superstar org-bullets helm gruvbox-theme-dark fzf evil-org evil-commentary evil-collection counsel company command-log-mode beacon all-the-icons airline-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
