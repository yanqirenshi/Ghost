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
  (let ((graph         (get-graph))
        (email-address |mail|)
        (password      |password|))
    (sign-in graph email-address password)))


(defroute ("/sign/out" :method :POST) ()
  (sign-out))


(defroute "/session/check" ()
  (render-json (check-session)))


;;;;;
;;;;; Draft or Temprary
;;;;;
(defroute ("/emails/password" :method :POST) (&key |password_old| |password_new|)
  (let ((session (get-session))
        (graph (get-graph))
        (password_old (string-trim '(#\Space #\Tab #\Newline) |password_old|))
        (password_new (string-trim '(#\Space #\Tab #\Newline) |password_new|)))
    (render-json (change-emails-password graph session password_old password_new))))


(defroute "/ghosts/:id" (&key id)
  (let ((graph (get-graph)))
    (render-json (get-ghost graph id))))


(defroute "/list/ghosts/with/email" ()
  (let ((graph (get-graph)))
    (render-json (ghost.ctlr:list-ghosts-with-email graph))))


(defroute "/list/ghosts/with/email" ()
  (let ((graph (get-graph)))
    (render-json (ghost.ctlr:list-ghosts-with-email graph))))


(defroute ("/ghosts/emails" :method :POST) (&key |mail| |password|)
  (let ((graph (get-graph))
        (email-address (validate |mail|     :email  :require t :url-decode t))
        (password      (validate |password| :string :require t :url-decode t)))
    (render-json (make-ghost-with-email-password graph email-address password))))


;;;;;
;;;;; Error pages
;;;;;
(defmethod on-exception ((app <router>) (code (eql 404)))
  (declare (ignore app))
  "404")
