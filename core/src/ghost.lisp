(in-package :ghost)

(defun tx-make-ghost (graph &key %id)
  (shinra:tx-make-vertex graph 'ghost
                         (when %id `((%id ,%id)))))

(defun get-ghost (graph &key %id)
  (shinra:get-vertex-at graph 'ghost :%id %id))


;;;;;
;;;;; いる？
;;;;;
(defgeneric nirvana! (buddha-nature)
  (:method ((buddha-nature buddha-nature))
    (setf (nirvana buddha-nature)
          (get-universal-time))))
