(in-package :ghost.controller)


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
