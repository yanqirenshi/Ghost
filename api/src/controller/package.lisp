(defpackage ghost.controller
  (:nicknames ghost.ctlr)
  (:use :cl)
  (:import-from :caveman2
                #:throw-code
                #:request-cookies
                #:*request*
                #:*session*)
  (:export #:sign-in-by-email))
(in-package :ghost.controller)


;;;;;
;;;;; session
;;;;;
(defvar *session-key-name*
  "lack.session")

(defun get-session-key ()
  (let ((cookie (request-cookies *request*)))
    (cdr (assoc *session-key-name* cookie :test 'string=))))

(defun save-session (ghost)
  (let ((session-key (get-session-key))
        (session *session*))
    (setf (gethash session-key session) (up:%id ghost))))


;;;;;
;;;;; sign-in-by-email
;;;;;
(defun get-sign-in-email (graph email-address password)
  (let ((email (ghost:get-email graph :address email-address)))
    (unless (or email (ghost:auth-deccot email password))
      (throw-code 401))
    email))

(defun get-sign-in-email-ghost (graph email-address password)
  (let ((email (get-sign-in-email graph email-address password)))
    (let ((ghost (ghost:deccot-ghost graph email)))
      (or ghost (throw-code 401)))))

(defun sign-in-by-email (graph email-address password)
  (let ((ghost (get-sign-in-email-ghost graph email-address password)))
    (save-session ghost)
    (list :|status| "success")))
