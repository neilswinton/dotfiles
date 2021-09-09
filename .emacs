(setq desktop-restore-forces-onscreen nil)
(add-hook 'desktop-after-read-hook
 (lambda ()
   (frameset-restore
    desktop-saved-frameset
    :reuse-frames (eq desktop-restore-reuses-frames t)
    :cleanup-frames (not (eq desktop-restore-reuses-frames 'keep))
    :force-display desktop-restore-in-current-display
    :force-onscreen desktop-restore-forces-onscreen)))


(if (file-exists-p "~/git/home/.emacs")
    (load "~/git/home/.emacs")
    )
(if (file-exists-p "~/git/yaml-mode/.emacs")
    (load "~/git/yaml-mode/.emacs")
    )
(if (file-exists-p "~/.emacs.local")
    (load "~/.emacs.local")
    )
(setq shell-file-name "bash")
(setq manual-program "dman")

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-auto-align-backslashes t)
 '(display-time-world-list (quote (("EST5EDT" "New York") ("UTC" "Universal"))))
 '(package-selected-packages (quote (nginx-mode git string-inflection terraform-mode)))
 '(safe-local-variable-values (quote ((c-default-style . "bsd"))))
 '(sort-fold-case t t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq manual-program "dman")
