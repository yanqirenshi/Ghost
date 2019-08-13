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
  (sign-out)
  (caveman2:redirect *redirect-url-sign-in*))

;;;;;
;;;;; Draft or Temprary
;;;;;
(defroute ("/emails/password" :method :POST) (&key |password_old| |password_new|)
  (let ((session (get-session))
        (graph (get-graph))
        (password_old (string-trim '(#\Space #\Tab #\Newline) |password_old|))
        (password_new (string-trim '(#\Space #\Tab #\Newline) |password_new|)))
    (unless session
      (caveman2:redirect *redirect-url-sign-in*))
    (render-json (change-emails-password graph session password_old password_new))))

(defroute "/ghosts/:id" (&key id)
  (let ((graph (get-graph)))
    (render-json
     (cond ((string= "temporary" id)
            (ghost.ctlr:find-ghosts graph))
           ((string= "session" id)
            (ghost.ctlr:session-ghost graph (get-session)))
           (t :null)))))

(defroute "/list/ghosts/with/email" ()
  (let ((graph (get-graph)))
    (render-json (ghost.ctlr:list-ghosts-with-email graph))))

(defroute "/list/ghosts/with/email" ()
  (let ((graph (get-graph)))
    (render-json (ghost.ctlr:list-ghosts-with-email graph))))

(defroute ("/ghosts/emails" :method :POST) (&key |mail| |password|)
  (let ((graph (get-graph))
        (email-address (quri:url-decode |mail|))
        (password      (quri:url-decode |password|)))
    (validation email-address :email  :require t)
    (validation password      :string :require t)
    (up:execute-transaction
     (ghost::tx-make-ghost-with-email-password graph
                                               :address  email-address
                                               :password password))
    (render-json (list :code 201))))


;;;;;
;;;;; Error pages
;;;;;
(defmethod on-exception ((app <router>) (code (eql 404)))
  (declare (ignore app))
  "404")
