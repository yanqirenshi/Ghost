(in-package :ghost)

(defgeneric tx-make-deccot-84key (graph deccot 84key)
  (:method (graph (deccot email) (84key 84key))
    (shinra:tx-make-edge graph 'edge deccot 84key :have-to)))


(defgeneric deccot-84key (graph deccot)
  (:method (graph (deccot email))
    (first (shinra:find-r-vertex graph 'edge
                                 :from deccot
                                 :vertex-class '84key
                                 :edge-type :have-to))))
