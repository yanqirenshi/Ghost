(defpackage ghost.api.utililties
  (:use #:cl)
  (:export #:get-graph))
(in-package :ghost.api.utililties)

(defun get-graph ()
  (ghost.graph:get-graph :ghost))
