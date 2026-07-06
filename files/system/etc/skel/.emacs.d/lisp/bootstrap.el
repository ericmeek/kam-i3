;;; bootstrap.el

(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if needed.
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package evil
  :ensure t)

(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-mode)
  :custom
  (python-indent-offset 4))

(use-package cc-mode
  :ensure nil
  :hook
  (c-mode . (lambda()
	      (setq c-basic-offset 4
		    tab-width 4
		    indent-tabs-mode nil))))

(require 'project)

(use-package eat
  :ensure t)

(provide 'bootstrap)
