(in-package :ghost)

(defgeneric deccot-84key (graph deccot)
  (:method (graph (deccot email))
    (first (shinra:find-r-vertex graph 'edge
                                 :from deccot
                                 :vertex-class '84key
                                 :edge-type :have-to))))
