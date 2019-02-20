(defpackage ghost.api.utililties
  (:nicknames :ghost.api.util)
  (:use #:cl)
  (:export #:get-graph))
(in-package :ghost.api.utililties)

(defun get-graph ()
  (ghost.graph:get-graph :ghost))
