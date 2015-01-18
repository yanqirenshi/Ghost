#|
This file is a part of ghost project.
Copyright (c) 2015 Satoshi Iwasaki (yanqirenshi@gmail.com)
|#

(in-package :cl-user)
(defpackage ghost-test-asd
  (:use :cl :asdf))
(in-package :ghost-test-asd)

(defsystem ghost-test
  :author "Satoshi Iwasaki"
  :license "LLGPL"
  :depends-on (:ghost
               :prove)
  :components ((:module "t"
                        :components
                        ((:test-file "ghost"))))

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
