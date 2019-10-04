(in-package :ghost.controller)


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

(defun check-session ()
  (let ((session (get-session)))
    (unless session
      (caveman2:redirect *redirect-url-sign-in*))
    (list :|_id| session :|_class| "GHOST")))
