;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)
;; Make org-mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-directory "~/Ubuntu One/orgmode")
 '(org-mobile-directory "~/Ubuntu One")
 '(org-agenda-files (quote ("agendas.org" )))
 '(org-mobile-files (quote (org-agenda-files org-agenda-text-search-extra-files "~/Ubuntu One/orgmode/temp.org" "~/Ubuntu One/orgmode/it.org" "~/Ubuntu One/orgmode/phd.org")))
 '(org-mobile-inbox-for-pull "~/Ubuntu One/orgmode/from-mobile.org"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
