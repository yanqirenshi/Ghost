(defpackage ghost.controller
  (:nicknames :ghost.ctlr)
  (:use :cl)
  (:import-from :alexandria
                #:when-let)
  (:import-from :caveman2
                #:throw-code
                #:request-cookies
                #:*request*
                #:*session*)
  (:export #:sign-in
           #:sign-out
           #:check-session
           #:change-emails-password
           #:get-ghost
           #:make-ghost-with-email-password)
  (:export #:*redirect-url-success-sign-in*
           #:*redirect-url-sign-in*)
  (:export #:sign-in-by-email
           #:get-session
           #:*session-key-name*
           #:session-ghost
           #:find-ghosts)
  (:export #:list-ghosts-with-email))
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

(defmethod jojo:%to-json ((user ghost:ghost))
  (jojo:with-object
    (jojo:write-key-value "_id" (up:%id user))))

(defun session-ghost (graph session)
  (when (and graph session)
    (ghost:get-ghost graph :%id session)))


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
;;;;; sign-in
;;;;;
(defvar *redirect-url-sign-in* nil)
(defvar *redirect-url-success-sign-in* nil)

(defun sign-in (graph email-address password)
  (let ((result (sign-in-by-email graph email-address password)))
      (if (null *redirect-url-success-sign-in*)
          result
          (caveman2:redirect *redirect-url-success-sign-in*))))

;;;;;
;;;;; sign-out
;;;;;
(defun sign-out ()
  (remove-session)
  (caveman2:redirect *redirect-url-sign-in*))


;;;;;
;;;;; find-ghosts
;;;;;
(defun find-ghosts-to-plist (ghost email)
  (let ((email-plist (list :|_id|         (up:%id email)
                           :|code|        (or (ghost::code email) :null)
                           :|address|     (ghost::address email)
                           :|buddhahood|  (local-time:format-timestring nil (ghost::buddhahood email))
                           :|nirvana|     (or (ghost::nirvana email) :null))))
    (list :|_id|         (up:%id ghost)
          :|buddhahood|  (local-time:format-timestring nil (ghost::buddhahood ghost))
          :|nirvana|     (or (ghost::nirvana ghost) :null)
          :|email|       email-plist)))

(defun find-ghosts (graph)
  (let ((ghosts (shinra:find-vertex graph 'ghost::ghost))
        (out nil))
    (dolist (ghost ghosts)
      (let ((email (ghost::ghost-deccot-email graph ghost)))
        (when email
          (push (find-ghosts-to-plist ghost email)
                out))))
    out))


(defun check-session ()
  (let ((session (get-session)))
    (unless session
      (caveman2:redirect *redirect-url-sign-in*))
    (list :|_id| session :|_class| "GHOST")))

;;;;;
;;;;; change password
;;;;;
(defun tx-change-emails-passwords (graph password_old password_new 84key-list)
  (when-let ((84key (car 84key-list)))
    ;; ねんのためチェック
    (assert (string= password_old (ghost::contents 84key)))
    (setf (ghost::contents 84key) password_new)
    (tx-change-emails-passwords graph password_old password_new (cdr 84key-list))))

(defun find-change-emails-password (graph password_old password_new mails)
  (when-let ((mail (car mails)))
    (when-let ((84key (ghost::deccot-84key graph mail)))
      (if (string/= password_old (ghost::contents (ghost::deccot-84key graph mail)))
          (change-emails-password-cor graph password_old password_new (cdr mails))
          (cons 84key (change-emails-password-cor graph password_old password_new (cdr mails)))))))

(defun change-emails-password (graph ghost-id password_old password_new)
  (unless ghost-id
    (caveman2:redirect *redirect-url-sign-in*))
  (assert (or password_old (= 0 (length password_old))))
  (assert (or password_new (= 0 (length password_new))))
  (let ((ghost (ghost:get-ghost graph :%id ghost-id)))
    (assert ghost)
    (let ((mails (ghost::ghost-deccot-emails graph ghost)))
      (assert mails)
      (let ((84key-list (find-change-emails-password graph password_old password_new mails)))
        (up:execute-transaction 
         (tx-change-emails-passwords graph password_old password_new 84key-list))
        (list :count (length 84key-list))))))


;;;;;
;;;;; List
;;;;;
(defun list-ghosts-with-email-core (graph ghost-list)
  (when-let ((ghost (car ghost-list)))
    (let ((email (ghost::ghost-deccot-email graph ghost)))
      (if (null email)
          (list-ghosts-with-email-core graph (cdr ghost-list))
          (cons (list :email email :ghost ghost)
                (list-ghosts-with-email-core graph (cdr ghost-list)))))))

(defun list-ghosts-with-email (graph)
  (mapcar #'(lambda (plist)
              (let ((ghost (getf plist :ghost))
                    (email (getf plist :email)))
                (list :|%id| (up:%id ghost)
                      :|email| (ghost::address email))))
          (list-ghosts-with-email-core (ghost.graph:get-graph :ghost)
                                       (shinra:find-vertex graph 'ghost:ghost))))
