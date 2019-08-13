(in-package :ghost.graph)

;;;;;
;;;;; *graphs*
;;;;;
(defvar *graphs* (make-hash-table)
  "Graph を複数保持できるようにしている。
同じメモリ空間だと一つの認証しか管理出来ないので。
標準のキーは :ghost ね。")


;;;;;
;;;;; Others
;;;;;
(defvar *graph-code-default* :ghost)
(defvar *graph-stor-directories* (make-hash-table))

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

(defun set-default-graph-stor ()
  (let ((code *graph-code-default*))
    (setf (gethash code *graph-stor-directories*)
          (graph-stor-dir code))))
(set-default-graph-stor)

(defun get-graph (code)
  (gethash code *graphs*))

(defun make-graph (code)
  (let ((path (gethash code *graph-stor-directories*)))
    (assert path)
    (or (get-graph code)
        (setf (gethash code *graphs*)
              (shinra:make-banshou 'shinra:banshou path)))))

;;;;;
;;;;; Basic Operators
;;;;;
(defun start (&optional (code *graph-code-default*))
  (make-graph code))

(defun snapshot (code)
  (up:snapshot (get-graph code)))

(defun stop (&optional (code *graph-code-default*))
  (let ((graph (get-graph code)))
    (when graph
      (up:stop graph)
      (remhash code *graphs*))))
