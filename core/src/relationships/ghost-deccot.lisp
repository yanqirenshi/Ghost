(in-package :ghost)

(defgeneric deccot-ghost (graph deccot)
  (:method (graph (deccot email))
    (first (shinra:find-r-vertex graph 'edge
                                 :to deccot
                                 :vertex-class 'ghost
                                 :edge-type 'have-to))))
