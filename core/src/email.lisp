(in-package :ghost)

(defun get-email (graph &key address)
  (first (shinra:find-vertex graph 'email :slot 'address :value address)))

(defgeneric auth-deccot (graph deccot passord)
  (:method (graph (deccot email) (password string))
    (let ((84key (deccot-84key graph deccot)))
      (turn-the-key 84key password))))
