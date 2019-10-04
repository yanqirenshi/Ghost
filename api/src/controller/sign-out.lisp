(in-package :ghost.controller)

(defun sign-out ()
  (remove-session)
  (caveman2:redirect *redirect-url-sign-in*))
