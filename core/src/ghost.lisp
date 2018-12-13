(in-package :ghost)

(defun tx-make-ghost (graph)
  (shinra:tx-make-vertex graph 'ghost))


;;;;;
;;;;; いる？
;;;;;
(defgeneric nirvana! (buddha-nature)
  (:method ((buddha-nature buddha-nature))
    (setf (nirvana buddha-nature)
          (get-universal-time))))
