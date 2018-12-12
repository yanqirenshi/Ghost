#|
  This file is a part of ghost.api project.
|#

(defsystem "ghost.api-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("ghost.api"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "ghost.api"))))
  :description "Test system for ghost.api"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
