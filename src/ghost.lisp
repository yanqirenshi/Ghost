(in-package :ghost)

(defgeneric nirvana! (buddha-nature)
  (:method ((buddha-nature buddha-nature))
    (setf (nirvana buddha-nature)
          (get-universal-time))))
