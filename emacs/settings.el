(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;;(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil ))

(package-install 'counsel)
(package-install 'ivy)
(package-install 'swiper)
(package-install 'smart-mode-line)
(package-install 'powerline)
(package-install 'gruvbox-theme)
(package-install 'airline-themes)
(package-install 'org)
(package-install 'ido)
(package-install 'tuareg)
(package-install 'projectile)
(package-install 'company)
(package-install 'org-bullets)
(package-install 'org-superstar)
(package-install 'helm)
(package-install 'evil)
(package-install 'evil-org)
(package-install 'smartparens)
;;(package-install 'evil-org-agenda)
(package-install 'evil-commentary)
(package-install 'evil-collection)
(package-install 'fzf)
(package-install 'merlin)
(package-install 'auto-complete)

(set-face-attribute 'mode-line nil  :height 170)

(use-package command-log-mode
:ensure t
:config
(global-command-log-mode)
)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(tool-bar-mode -1)
 (toggle-scroll-bar -1)
 (setq inhibit-startup-screen t)  

 (global-hl-line-mode t) ;; This highlights the current line in the buffer

 (use-package beacon ;; This applies a beacon effect to the highlighted line
 :ensure t
 :config
 (beacon-mode 1))
; (global-hl-mode +1)

;; start the initial frame maximized
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; (add-to-list 'exec-path "/usr/local/bin")
;; (add-to-list 'exec-path "/home/k8s/.fzf/bin")
;; (add-to-list 'exec-path "/usr/bin")
 (setq exec-path (append exec-path '("/home/k8s/.fzf/bin")))
 (setenv "PATH" (concat (getenv "PATH") ":/home/k8s/.fzf/bin"))

;;(require 'smartparens-config)
;; Always start smartparens mode in js-mode.
;;(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
;;(sp-local-pair 'org-mode "\\[" "\\]")
;;(sp-local-pair 'org-mode "$" "$")
;;(sp-local-pair 'org-mode "'" "'" :actions '(rem))
;;(sp-local-pair 'org-mode "=" "=" :actions '(rem))
;;(sp-local-pair 'org-mode "\\left(" "\\right)" :trigger "\\l(" :post-handlers '(sp-latex-insert-spaces-inside-pair))
;;(sp-local-pair 'org-mode "\\left[" "\\right]" :trigger "\\l[" :post-handlers '(sp-latex-insert-spaces-inside-pair))
;;(sp-local-pair 'org-mode "\\left\\{" "\\right\\}" :trigger "\\l{" :post-handlers '(sp-latex-insert-spaces-inside-pair))
;(sp-local-pair 'org-mode "\\left|" "\\right|" :trigger "\\l|" :post-handlers '(sp-latex-insert-spaces-inside-pair))

;; enable globally    
(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0)
(setq company-dabbrev-downcase 0)
(defun tab-indent-or-complete ()
(interactive)
(if (minibufferp)
    (minibuffer-complete)
    (if (or (not yas-minor-mode)
	    (null (do-yas-expand)))
	(if (check-expansion)
	    (company-complete-common)
	(indent-for-tab-command)))))

(global-set-key [backtab] 'tab-indent-or-complete)

;; Enable Evil
;; Evil
(use-package evil 
:init
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
:config
    (evil-mode 1)
    (setq evil-emacs-state-cursor '("red" box)
	    evil-normal-state-cursor '("green" box)
	    evil-visual-state-cursor '("orange" box)
	    evil-insert-state-cursor '("blue" bar)
	    evil-replace-state-cursor '("red" bar)
	    evil-operator-state-cursor '("red" hollow)
	    evil-cross-lines t)
)

(use-package evil-collection
:after evil
;; :ensure t
:config
(evil-collection-init)
)

(require 'evil-commentary)
(evil-commentary-mode)
(evil-collection-init)

(org-babel-do-load-languages
'org-babel-load-languages
    '((python . t)
    (ocaml . t)))

(setq org-hide-emphasis-markers t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)
(require 'org-tempo)

;; (use-package org-bullets
;;     :config
;;     (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-superstar
    :config
    (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

;; (add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(use-package evil-org
    :ensure t
    :after (evil org)
    :config
    (add-hook 'org-mode-hook 'evil-org-mode)
    (add-hook 'evil-org-mode-hook
		(lambda ()
		(evil-org-set-key-theme 
		  '(todo navigation insert textobjects additional calendar))))
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))

;; (let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
;; (when (and opam-share (file-directory-p opam-share))
;; ;; Register Merlin
;; (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
;; (autoload 'merlin-mode "merlin" nil t nil)
;; ;; Automatically start it in OCaml buffers
;; (add-hook 'tuareg-mode-hook 'merlin-mode t)
;; (add-hook 'caml-mode-hook 'merlin-mode t)
;; ;; Use opam switch to lookup ocamlmerlin binary
;; (setq merlin-command 'opam)))

;; (ivy-mode 1)
;; (setq ivy-use-virtual-buffers t)
;; (setq enable-recursive-minibuffers t)
;; ;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
;; (global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "<f6>") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(use-package ivy
  :ensure t
  :delight
  :config
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-height-alist '((t lambda (_caller) (/ (window-height) 4))))
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap nil)
  (setq ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy)
          (ivy-switch-buffer . ivy--regex-fuzzy)
          (ivy-switch-buffer-other-window . ivy--regex-fuzzy)
          (counsel-rg . ivy--regex-or-literal)
          (t . ivy--regex-plus)))
  (setq ivy-display-style 'fancy)
  (setq ivy-use-selectable-prompt t)
  (setq ivy-fixed-height-minibuffer nil)
  (setq ivy-initial-inputs-alist
        '((counsel-M-x . "^")
          (ivy-switch-buffer . "^")
          (ivy-switch-buffer-other-window . "^")
          (counsel-describe-function . "^")
          (counsel-describe-variable . "^")
          (t . "")))

  (ivy-set-occur 'counsel-fzf 'counsel-fzf-occur)
  (ivy-set-occur 'counsel-rg 'counsel-ag-occur)
  (ivy-set-occur 'ivy-switch-buffer 'ivy-switch-buffer-occur)
  (ivy-set-occur 'swiper 'swiper-occur)
  (ivy-set-occur 'swiper-isearch 'swiper-occur)
  (ivy-set-occur 'swiper-multi 'counsel-ag-occur)
  :hook ((after-init . ivy-mode)
         (ivy-occur-mode . hl-line-mode))
  :bind (("<s-up>" . ivy-push-view)
		 ("<s-down>" . ivy-switch-view)
         ("C-S-r" . ivy-resume)
         :map ivy-occur-mode-map
         ("f" . forward-char)
         ("b" . backward-char)
         ("n" . ivy-occur-next-line)
         ("p" . ivy-occur-previous-line)
         ("<C-return>" . ivy-occur-press)))

(use-package counsel
:ensure t
:after ivy
:config
(setq counsel-yank-pop-preselect-last t)
(setq counsel-yank-pop-separator "\n—————————\n")
(setq counsel-rg-base-command
	"rg -SHn --no-heading --color never --no-follow --hidden %s")
(setq counsel-find-file-occur-cmd; TODO Simplify this
	"ls -a | grep -i -E '%s' | tr '\\n' '\\0' | xargs -0 ls -d --group-directories-first")

(defun prot/counsel-fzf-rg-files (&optional input dir)
    "Run `fzf' in tandem with `ripgrep' to find files in the
present directory.  If invoked from inside a version-controlled
repository, then the corresponding root is used instead."
    (interactive)
    (let* ((process-environment
	    (cons (concat "FZF_DEFAULT_COMMAND=rg -Sn --color never --files --no-follow --hidden")
		process-environment))
	(vc (vc-root-dir)))
    (if dir
	(counsel-fzf input dir)
	(if (eq vc nil)
	    (counsel-fzf input default-directory)
	(counsel-fzf input vc)))))

(defun prot/counsel-fzf-dir (arg)
    "Specify root directory for `counsel-fzf'."
    (prot/counsel-fzf-rg-files ivy-text
			    (read-directory-name
				(concat (car (split-string counsel-fzf-cmd))
					" in directory: "))))

(defun prot/counsel-rg-dir (arg)
    "Specify root directory for `counsel-rg'."
    (let ((current-prefix-arg '(4)))
    (counsel-rg ivy-text nil "")))

;; TODO generalise for all relevant file/buffer counsel-*?
(defun prot/counsel-fzf-ace-window (arg)
    "Use `ace-window' on `prot/counsel-fzf-rg-files' candidate."
    (ace-window t)
    (let ((default-directory (if (eq (vc-root-dir) nil)
				counsel--fzf-dir
			    (vc-root-dir))))
    (if (> (length (aw-window-list)) 1)
	(find-file arg)
	(find-file-other-window arg))
    (balance-windows (current-buffer))))

;; Pass functions as appropriate Ivy actions (accessed via M-o)
(ivy-add-actions
'counsel-fzf
'(("r" prot/counsel-fzf-dir "change root directory")
    ("g" prot/counsel-rg-dir "use ripgrep in root directory")
    ("a" prot/counsel-fzf-ace-window "ace-window switch")))

(ivy-add-actions
'counsel-rg
'(("r" prot/counsel-rg-dir "change root directory")
    ("z" prot/counsel-fzf-dir "find file with fzf in root directory")))

(ivy-add-actions
'counsel-find-file
'(("g" prot/counsel-rg-dir "use ripgrep in root directory")
    ("z" prot/counsel-fzf-dir "find file with fzf in root directory")))

;; Remove commands that only work with key bindings
(put 'counsel-find-symbol 'no-counsel-M-x t)
:bind (("M-x" . counsel-M-x)
	("C-x C-f" . counsel-find-file)
	("s-f" . counsel-find-file)
	("s-F" . find-file-other-window)
	("C-x b" . ivy-switch-buffer)
	("s-b" . ivy-switch-buffer)
	("C-x B" . counsel-switch-buffer-other-window)
	("s-B" . counsel-switch-buffer-other-window)
	("C-x d" . counsel-dired)
	("s-d" . counsel-dired)
	("s-D" . dired-other-window)
	("C-x C-r" . counsel-recentf)
	("s-m" . counsel-mark-ring)
	("s-r" . counsel-recentf)
	("s-y" . counsel-yank-pop)
	("C-h f" . counsel-describe-function)
	("C-h v" . counsel-describe-variable)
	("M-s r" . counsel-rg)
	("M-s g" . counsel-git-grep)
	("M-s l" . counsel-find-library)
	("M-s z" . prot/counsel-fzf-rg-files)
	:map ivy-minibuffer-map
	("C-r" . counsel-minibuffer-history)
	("s-y" . ivy-next-line)        ; Avoid 2× `counsel-yank-pop'
	("C-SPC" . ivy-restrict-to-matches)))

(use-package prescient
  :ensure t
  :config
  (setq prescient-history-length 200)
  (setq prescient-save-file "~/.emacs.d/prescient-items")
  (setq prescient-filter-method '(literal regexp))
  (prescient-persist-mode 1))

(use-package ivy-prescient
  :ensure t
  :after (prescient ivy)
  :config
  (setq ivy-prescient-sort-commands
        '(:not counsel-grep
               counsel-rg
               counsel-switch-buffer
               ivy-switch-buffer
               swiper
               swiper-multi))
  (setq ivy-prescient-retain-classic-highlighting t)
  (setq ivy-prescient-enable-filtering nil)
  (setq ivy-prescient-enable-sorting t)
  (ivy-prescient-mode 1))

(use-package ivy-posframe
:ensure t
:delight
:config
(setq ivy-posframe-parameters
	'((left-fringe . 2)
	(right-fringe . 2)
	(internal-border-width . 2)
	;; (font . "Iosevka-10.75:hintstyle=hintfull")
))
(setq ivy-posframe-height-alist
	'((swiper . 15)
	(swiper-isearch . 15)
	(t . 10)))
(setq ivy-posframe-display-functions-alist
	'((complete-symbol . ivy-posframe-display-at-point)
	(swiper . nil)
	(swiper-isearch . nil)
	(t . ivy-posframe-display-at-frame-center)))
:hook (after-init . ivy-posframe-mode))

(use-package ivy-rich
:ensure t
:config
(setq ivy-rich-path-style 'abbreviate)
(setcdr (assq t ivy-format-functions-alist)
	#'ivy-format-function-line)
:hook (after-init . ivy-rich-mode))

(use-package swiper
:ensure t
:after ivy
:config
(setq swiper-action-recenter t)
(setq swiper-goto-start-of-match t)
(setq swiper-include-line-number-in-search t)
:bind (("C-S-s" . swiper)
	("M-s s" . swiper-multi)
	("M-s w" . swiper-thing-at-point)
	:map swiper-map
	("M-%" . swiper-query-replace)))

;; Theme settings
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(require 'powerline)
(powerline-vim-theme)
(require 'airline-themes)
(load-theme 'airline-onedark t)

;; (ivy-read "My buffers: " (mapcar #'buffer-name (buffer-list)))
