(in-package :ghost)

(defun get-email (graph &key address)
  (list graph address))

(defgeneric auth-deccot (deccot passord)
  (:method ((deccot email) (password string))
    (list deccot password)))
