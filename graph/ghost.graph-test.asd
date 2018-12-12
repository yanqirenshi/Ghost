#|
  This file is a part of ghost.graph project.
|#

(defsystem "ghost.graph-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("ghost.graph"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "ghost.graph"))))
  :description "Test system for ghost.graph"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
