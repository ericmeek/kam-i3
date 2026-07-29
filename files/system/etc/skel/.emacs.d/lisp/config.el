;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode 1)
(load-theme 'modus-vivendi t)
(set-face-attribute 'default nil :height 140)
(show-paren-mode 1)
(global-hl-line-mode 1)
(global-visual-line-mode 1)
(global-set-key (kbd "C-c p c") #'project-compile)

(with-eval-after-load 'org
  (require 'org-tempo)
  (add-to-list 'org-tempo-keywords-alist '("vl" . "│"))
  (add-to-list 'org-tempo-keywords-alist '("ib" . "├──"))
  (add-to-list 'org-tempo-keywords-alist '("fb" . "└──"))
  (add-to-list 'org-tempo-keywords-alist '("hl" . "─")))

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c d v") (lambda () (interactive) (insert "│")))
  (define-key org-mode-map (kbd "C-c d i") (lambda () (interactive) (insert "├──")))
  (define-key org-mode-map (kbd "C-c d f") (lambda () (interactive) (insert "└──")))
  (define-key org-mode-map (kbd "C-c d h") (lambda () (interactive) (insert "─"))))

(global-set-key (kbd "C-c p f f") #'project-find-file)

;; Ctrl-F starts search from the top of the current buffer
(defun my/isearch-forward-from-top ()
  "Start an incremental search from the beginning of the buffer."
  (interactive)
  (goto-char (point-min))
  (isearch-forward))

(global-set-key (kbd "C-f") #'my/isearch-forward-from-top)

;; While searching, Ctrl-F finds the next match
(with-eval-after-load 'isearch
  (define-key isearch-mode-map (kbd "C-f") #'isearch-repeat-forward)

  ;; Do not pause when wrapping
  (when (boundp 'isearch-wrap-pause)
    (setq isearch-wrap-pause nil)))

(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(require 'eglot)
(add-hook 'c-mode-hook #'eglot-ensure)
(setq tab-always-indent 'complete)
(setq completion-cycle-threshold 3)

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  :init
  (global-corfu-mode))

(add-hook 'org-mode-hook #'org-num-mode)

(require 'navigation)
(require 'ai)
(require 'project-ai)
(provide 'config)
