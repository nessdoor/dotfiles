(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/org/gtd/"))
 '(org-agenda-restore-windows-after-quit t)
 '(org-capture-templates
   '(("t" "Todo" entry
      (file+headline "gtd/main.org" "Tasks")
      "* TODO %^{Brief Description} %^g
  %?
Added: %U" :empty-lines-after 1)
     ("d" "Diary entry" entry
      (file "journal.org")
      "* %U
  %?" :empty-lines-after 1)))
 '(package-selected-packages
   '(evil-numbers markdown-mode yaml-mode dockerfile-mode company-quickhelp visible-mark company pdf-tools evil-matchit evil-surround evil powerline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:foreground "color-33"))))
 '(minibuffer-prompt ((t (:foreground "color-33"))))
 '(org-agenda-structure ((t (:foreground "color-33"))))
 '(org-drawer ((t (:foreground "color-27"))))
 '(org-hide ((t (:foreground "color-236"))))
 '(org-scheduled ((t (:foreground "color-34"))))
 '(org-scheduled-today ((t (:inherit org-scheduled :weight bold))))
 '(outline-1 ((t (:inherit font-lock-function-name-face)))))

;;;;;;;;;;;;;;;

;;; Packages
;; Company
; Make Company not to downcase its completions
(setq company-dabbrev-downcase nil)
; Activate Company for any well-defined programming major mode
(add-hook 'prog-mode-hook 'company-mode)

;; Evil
(require 'evil)
(evil-mode 1)

;; Surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Matchit
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; Numbers
(require 'evil-numbers)
(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

;; Powerline
(require 'powerline)
(powerline-center-evil-theme)

;; Visible mark
(require 'visible-mark)
(global-visible-mark-mode 1)

;;;;;;;;;;;;;;;

;;; Text editing settings
;; Tab settings
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;; Parentheses
; Always show matching parentheses
(show-paren-mode 1)

;;;;;;;;;;;;;;;

;;; Automatic backups
; Activate backups for files under VC
(setq vc-make-backup-files t)

; Cleanup policy
(setq backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 2
      kept-old-versions 2
 )

; Set backup destination for backups
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory
                        (convert-standard-filename "backups/"))))
 )

; Functions for forcing backups on every save
(defun force-buffer-backup ()
  (setq buffer-backed-up nil)
 )

; Register the function so as to save before every write
(add-hook 'before-save-hook 'force-buffer-backup)
(put 'upcase-region 'disabled nil)

;;;;;;;;;;;;;;;

;;; Org mode settings
;; Quick org-capture access
(define-key global-map "\C-cr" 'org-capture)

;; Quick org-agenda access
(define-key global-map "\C-ca" 'org-agenda)

;; Make it so that org_archive files are still treated as Org files
(add-to-list 'auto-mode-alist '("\\.org_archive\\'" . org-mode))
