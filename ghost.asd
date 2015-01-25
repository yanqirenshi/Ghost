#|
This file is a part of ghost project.
Copyright (c) 2015 Satoshi Iwasaki (yanqirenshi@gmail.com)
|#

#|
Author: Satoshi Iwasaki (yanqirenshi@gmail.com)
|#

(in-package :cl-user)
(defpackage ghost-asd
  (:use :cl :asdf))
(in-package :ghost-asd)

(defsystem ghost
  :version "0.1"
  :author "Satoshi Iwasaki"
  :license "LLGPL"
  :depends-on (:upanishad
               :shinrabanshou
               :cl-oauth
               :clack)
  :components ((:module "src"
                        :components
                        ((:file "package")
			 (:file "class"   :depends-on ("package"))
			 (:file "ghost"   :depends-on ("class")))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op ghost-test))))
