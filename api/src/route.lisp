(in-package :cl-user)
(defpackage ghost.api.route
  (:use #:cl
        #:caveman2
        #:lack.middleware.validation
        #:ghost.api.render
        #:ghost.api.utililties)
  (:export #:*route*))
(in-package :ghost.api.route)


;;;;;
;;;;; Router
;;;;;
(defclass <router> (<app>) ())
(defvar *route* (make-instance '<router>))
(clear-routing-rules *route*)


;;;;;
;;;;; Routing rules
;;;;;
(defroute "/" ()
  (render-json "ネットは広大だわ・・・・・・・・"))

(defroute ("/sign/in" :method :POST) (&key |mail| |password|)
  (let ((mail |mail|)
        (password |password|))
    (render-json "ネットは広大だわ・・・・・・・・")))


;;;;;
;;;;; Error pages
;;;;;
(defmethod on-exception ((app <router>) (code (eql 404)))
  (declare (ignore app))
  "404")
