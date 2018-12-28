(defpackage ghost.controller
  (:nicknames ghost.ctlr)
  (:use :cl)
  (:import-from :caveman2
                #:throw-code
                #:request-cookies
                #:*request*
                #:*session*)
  (:export #:sign-in-by-email
           #:sign-out
           #:get-session))
(in-package :ghost.controller)


;;;;;
;;;;; session
;;;;;
(defvar *session-key-name*
  "ghost.session")

(defun get-session-key ()
  (let ((cookie (request-cookies *request*)))
    (cdr (assoc *session-key-name* cookie :test 'string=))))

(defun get-session ()
  (let ((session-key (get-session-key))
        (session *session*))
    (gethash session-key session)))

(defun save-session (ghost)
  (let ((session-key (get-session-key))
        (session *session*))
    (setf (gethash session-key session) (up:%id ghost))))

(defun remove-session ()
  (let ((session-key (get-session-key))
        (session *session*))
    (remhash session-key session)))

;;;;;
;;;;; sign-in-by-email
;;;;;
(defun get-sign-in-email (graph email-address password)
  (let ((email (ghost:get-email graph :address email-address)))
    (unless email (throw-code 401))
    (when (ghost:auth-deccot graph email password)
      email)))

(defun get-sign-in-email-ghost (graph email-address password)
  (let ((email (get-sign-in-email graph email-address password)))
    (unless email (throw-code 401))
    (let ((ghost (ghost:deccot-ghost graph email)))
      (or ghost (throw-code 401)))))

(defun sign-in-by-email (graph email-address password)
  (let ((ghost (get-sign-in-email-ghost graph email-address password)))
    (save-session ghost)
    (list :|status| "success")))


;;;;;
;;;;; sign-out
;;;;;
(defun sign-out ()
  (remove-session)
  (list :|status| "success"))
