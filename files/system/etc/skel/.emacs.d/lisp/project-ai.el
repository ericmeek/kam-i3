;;; project-ai.el --- AI helpers for project documentation -*- lexical-binding: t; -*-

(require 'project)

(defun project-ai-root ()
  "Return the current project's root directory."
  (project-root (project-current t)))

(defun project-ai-chat-file ()
  "Return the AI notebook for the current project."
  (expand-file-name "docs/ai-chat.org"
		    (project-ai-root)))

(defun project-ai-current-subtree ()
  "Return the current Org subtree as a string."
  (save-restriction
    (org-narrow-to-subtree)
    (buffer-string)))

(defun project-ai-review-subtree ()
  "Append the current subtree to the project's AI notebook."
  (interactive)

  (let ((text (project-ai-current-subtree))
	question-pos)
    
    (with-current-buffer
	(find-file-noselect (project-ai-chat-file))

      (goto-char (point-max))

      (insert "\n\n")
      (insert "--------------------------------------------------\n\n")
      (insert text)
      (insert "\n\nQuestion:\n\n")

      (setq question-pos (point))
      
      (save-buffer)

      (pop-to-buffer (current-buffer))

      (goto-char question-pos)
      (recenter-if-needed))))

(global-set-key
 (kbd "C-c g r")
 #'project-ai-review-subtree)

(provide 'project-ai)
