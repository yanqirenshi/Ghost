(in-package :ghost)


(defgeneric tx-make-ghost-deccot (graph ghost deccot)
  (:method (graph (ghost ghost) (deccot zaim))
    (shinra:tx-make-edge graph 'edge ghost deccot :have-to))
  (:method (graph (ghost ghost) (deccot email))
    (shinra:tx-make-edge graph 'edge ghost deccot :have-to)))


(defgeneric deccot-ghost (graph deccot)
  (:method (graph (deccot email))
    (first (shinra:find-r-vertex graph 'edge
                                 :to deccot
                                 :vertex-class 'ghost
                                 :edge-type :have-to))))


(defgeneric ghost-deccot (graph ghost &key deccot-class)
  (:method (graph (ghost ghost) &key deccot-class)
    (first (shinra:find-r-vertex graph 'edge
                                 :from ghost
                                 :vertex-class deccot-class
                                 :edge-type :have-to))))


(defgeneric ghost-deccot-email (graph ghost)
  (:method (graph (ghost ghost))
    (first (shinra:find-r-vertex graph 'edge
                                 :from ghost
                                 :vertex-class 'email
                                 :edge-type :have-to))))


(defgeneric ghost-deccot-emails (graph ghost)
  (:method (graph (ghost ghost))
    (shinra:find-r-vertex graph 'edge
                          :from ghost
                          :vertex-class 'email
                          :edge-type :have-to)))
