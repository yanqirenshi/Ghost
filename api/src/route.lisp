(in-package :cl-user)
(defpackage ghost.api.route
  (:use #:cl
        #:caveman2
        #:lack.middleware.validation
        #:ghost.api.render
        #:ghost.api.utililties
        #:ghost.controller)
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
  (let* ((messages '("そう囁くのよ・・・・・・私のゴーストが "
                    "さて・・・どこへ行こうかしら、ネットは広大だわ・・・・・・・・"))
         (i (length messages)))
    (render-json (nth i messages))))


(defroute ("/sign/in" :method :POST) (&key |mail| |password|)
  (let ((graph nil)
        (email-address |mail|)
        (password |password|))
    (render-json (sign-in-by-email graph email-address password))))


;;;;;
;;;;; Error pages
;;;;;
(defmethod on-exception ((app <router>) (code (eql 404)))
  (declare (ignore app))
  "404")
