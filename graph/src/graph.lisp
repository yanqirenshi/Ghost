(in-package :ghost.graph)

(defvar *graphs* (make-hash-table))

(defvar *graph-stor-base-directory*
  (concatenate 'string
               (uiop:getenv "HOME")
               "/.ghost/graph/~a/"))

(defun make-graph-stor-dir (code)
  (let ((code-string (string-downcase (symbol-name code))))
    (format nil *graph-stor-base-directory* code-string)))

(defun graph-stor-dir (code)
  (merge-pathnames (make-graph-stor-dir code)
                   (system-source-directory :ghost.graph)))

(defun get-graph (code)
  (gethash code *graphs*))

(defun make-graph (code)
  (or (get-graph code)
      (setf (gethash code *graphs*)
            (shinra:make-banshou 'shinra:banshou (graph-stor-dir code)))))

(defun start ()
  (make-graph :ghost))

(defun snapshot (code)
  (up:snapshot (get-graph code)))

(defun stop (code)
  (let ((graph (get-graph code)))
    (when graph
      (up:stop graph)
      (remhash code *graphs*))))
