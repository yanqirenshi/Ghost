(in-package :ghost.graph)

(defvar *graphs* (make-hash-table))

(defun graph-stor-dir (code)
  (merge-pathnames (format nil "data/~a/graph/" (string-downcase (symbol-name code)))
                   (system-source-directory :ghost.graph)))

(defun get-graph (code)
  (gethash code *graphs*))

(defun make-graph (code)
  (or (get-graph code)
      (setf (gethash code *graphs*)
            (shinra:make-banshou 'shinra:banshou (graph-stor-dir code)))))

(defun start ()
  (make-graph :gp)
  (make-graph :wbs))

(defun snapshot (code)
  (up:snapshot (get-graph code)))

(defun stop (code)
  (let ((graph (get-graph code)))
    (when graph
      (up:stop graph)
      (remhash code *graphs*))))
