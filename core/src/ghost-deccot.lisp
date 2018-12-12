(in-package :ghost)

(defgeneric deccot-ghost (graph deccot)
  (:method (graph (deccot email))
    (list graph deccot)))
