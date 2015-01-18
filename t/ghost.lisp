(in-package :cl-user)
(defpackage ghost-test
  (:use :cl
        :ghost
        :prove))
(in-package :ghost-test)

;; NOTE: To run this test file, execute `(asdf:test-system :ghost)' in your Lisp.

(plan nil)

;; blah blah blah.

(finalize)
