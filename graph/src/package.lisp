(defpackage ghost.graph
  (:use :cl)
  (:import-from :asdf
                #:system-source-directory)
  (:import-from :fad
                #:list-directory)
  (:import-from :shinra
                #:banshou
                #:make-banshou)
  (:export #:get-graph
           #:start
           #:stop
           #:snapshot))
(in-package :ghost.graph)
