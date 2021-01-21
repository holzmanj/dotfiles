
(require 'package)
(setq package-enable-at-startup nil)
;; using gnu mirror because the default link is broken for some reason
(setq package-archives '(("gnu" . "http://mirrors.163.com/elpa/gnu/")
                         ("org" . "http://orgmode.org/elpa/")))
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; this fixes some https-related issues with accessing melpa
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'org)
(org-babel-load-file "~/.emacs.d/config.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (doom-one)))
 '(custom-safe-themes
   (quote
    ("77113617a0642d74767295c4408e17da3bfd9aa80aaa2b4eeb34680f6172d71a" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(ivy-count-format "(%d/%d) " nil nil "Customized with use-package ivy")
 '(ivy-use-vertical-buffers t nil nil "Customized with use-package ivy")
 '(package-selected-packages
   (quote
    (doom-themes treemacs-magit evil-magit magit rainbow-delimiters rainbow-delimeters avy format-all attrap dante all-the-icons-ivy all-the-icons diminish spaceline rainbow-mode rainbow ivy evil spacemacs-theme which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 108 :width normal :foundry "PfEd" :family "Iosevka")))))
