(in-package :ghost)


(defgeneric tx-make-ghost-deccot (graph ghost deccot)
  (:method (graph (ghost ghost) (deccot email))
    (shinra:tx-make-edge graph 'edge ghost deccot :have-to)))


(defgeneric deccot-ghost (graph deccot)
  (:method (graph (deccot email))
    (first (shinra:find-r-vertex graph 'edge
                                 :to deccot
                                 :vertex-class 'ghost
                                 :edge-type :have-to))))
