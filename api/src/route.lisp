(in-package :cl-user)
(defpackage ghost.api.route
  (:use #:cl
        #:caveman2
        #:lack.middleware.validation
        #:ghost.api.render
        #:ghost.api.utililties
        #:ghost.controller)
  (:export #:*route*
           #:*redirect-url-success-sign-in*
           #:*redirect-url-sign-in*))
(in-package :ghost.api.route)


;;;;;
;;;;; Variables
;;;;;
(defvar *redirect-url-sign-in* nil)
(defvar *redirect-url-success-sign-in* nil)

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

(defroute "/session/check" ()
  (let ((session (get-session)))
    (unless session
      (caveman2:redirect *redirect-url-sign-in*))
    (render-json (list :|_id| session :|_class| "GHOST"))))

(defroute ("/sign/in" :method :POST) (&key |mail| |password|)
  (let ((graph (get-graph))
        (email-address |mail|)
        (password |password|))
    (let ((result (sign-in-by-email graph email-address password)))
      (if (null *redirect-url-success-sign-in*)
          result
          (caveman2:redirect *redirect-url-success-sign-in*)))))


(defroute ("/sign/out" :method :POST) ()
  (render-json (sign-out)))


;;;;;
;;;;; Error pages
;;;;;
(defmethod on-exception ((app <router>) (code (eql 404)))
  (declare (ignore app))
  "404")
