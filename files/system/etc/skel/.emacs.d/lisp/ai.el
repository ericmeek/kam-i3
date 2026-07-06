;;; ai.el

(use-package gptel
  :ensure t
  :defer t
  :config
  ;; hooks
  ;; keybindings
  ;; helper functions
  )

(defun my-gptel-jump-to-end (_start _end)
  "Move point to the end of the gptel conversation."
  (goto-char (point-max)))

(setq gptel-model 'gpt-5.5)
(global-set-key (kbd "C-c g g") #'gptel)
(global-set-key (kbd "C-c g s") #'gptel-send)
(global-set-key (kbd "C-c g m") #'gptel-menu)
(global-set-key (kbd "C-c g a") #'gptel-abort)

(add-hook 'gptel-post-response-functions #'my-gptel-jump-to-end)

(provide 'ai)
