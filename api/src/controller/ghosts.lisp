(in-package :ghost.controller)


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

(defun get-ghost (graph id)
  (cond ((string= "temporary" id)
         (find-ghosts graph))
        ((string= "session" id)
         (session-ghost graph (get-session)))
        (t :null)))
