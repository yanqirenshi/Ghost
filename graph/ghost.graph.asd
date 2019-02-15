#|
  This file is a part of ghost.graph project.
|#

(defsystem "ghost.graph"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (#:shinrabanshou)
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "graph"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "ghost.graph-test"))))
