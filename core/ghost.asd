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
                 (:module "classes"
                  :components ((:file "base")
                               (:file "ghost")
                               (:file "deccots")
                               (:file "cyber-space")
                               (:file "oauth")
                               (:file "84kye")
                               (:file "edge")))
                 (:file "ghost")
                 (:file "84key")
                 (:file "email")
                 (:module "relationships"
                  :components ((:file "ghost-deccot")
                               (:file "deccot-84key"))))))
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
