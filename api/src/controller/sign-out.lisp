(in-package :ghost.controller)

(defun sign-out ()
  (when (get-session)
    (remove-session)))

;; (defun sign-out ()
;;   (remove-session)
;;   (caveman2:redirect *redirect-url-sign-in*))
