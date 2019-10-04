#|
  This file is a part of ghost.api project.
|#

(defsystem "ghost.api"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (:caveman2 :lack-middleware-validation)
  :components ((:module "src"
                :components
                ((:module "controller"
                  :components ((:file "package")
                               (:file "session")
                               (:file "sign-in")
                               (:file "sign-out")
                               (:file "ghosts")
                               (:file "email")
                               (:file "list")))
                 (:file "package")
                 (:file "utililties")
                 (:file "render")
                 (:file "route"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "ghost.api-test"))))
