(in-package :ghost)


(defun tx-make-84key (graph password)
  (shinra:tx-make-vertex graph '84key `((contents ,password))))

(defgeneric turn-the-key (84key password)
  (:method ((84key 84key) (password string))
    (string= (contents 84key) password)))
