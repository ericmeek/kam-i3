;;; navigation.el

;; Move between windows with Meta + arrow keys
(global-set-key (kbd "C-M-<left>")  #'windmove-left)
(global-set-key (kbd "C-M-<right>") #'windmove-right)
(global-set-key (kbd "C-M-<up>")    #'windmove-up)
(global-set-key (kbd "C-M-<down>")  #'windmove-down)

(provide 'navigation)
