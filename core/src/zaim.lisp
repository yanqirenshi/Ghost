(in-package :ghost)


(defun tx-make-deccot-zaim (graph &key request-token-plist access-token-plist)
  (shinra:tx-make-vertex graph 'zaim
                         `((request-token ,request-token-plist)
                           (access-token  ,access-token-plist))))


(defun tx-make-ghost-deccot-zaim (graph ghost &key request-token-plist)
  (let ((zaim (tx-make-deccot-zaim graph :request-token-plist request-token-plist)))
    (tx-make-ghost-deccot graph ghost zaim)
    zaim))


(defun tx-clear-zaim-token-key (graph zaim &key request-token-plist)
  (up:tx-change-object-slots graph 'zaim
                             (up:%id zaim)
                             `((request-token ,request-token-plist)
                               (access-token  nil)))
  zaim)


(defun tx-ensure-ghost-deccot-zaim (graph ghost &key request-token-plist)
  (let ((zaim (ghost-deccot graph ghost :deccot-class 'zaim)))
    (if zaim
        (tx-clear-zaim-token-key   graph zaim  :request-token-plist request-token-plist)
        (tx-make-ghost-deccot-zaim graph ghost :request-token-plist request-token-plist))))


(defun find-ghost-zaim (graph ghost)
  (shinra:find-r-vertex graph 'edge
                        :from ghost
                        :vertex-class 'zaim
                        :edge-type :have-to))


(defun get-ghost-zaim (graph ghost &key request-token-key)
  (let ((zaim-list
          (remove-if #'(lambda (zaim)
                         (let ((request-token (request-token zaim)))
                           (string/= request-token-key
                                     (getf request-token :key))))
                     (find-ghost-zaim graph ghost))))
    (let ((len (length zaim-list)))
      (when (< 1 len)
        (warn "Zaim not single. size=~a~%" len)))
    (first zaim-list)))


(defun save-access-token (graph zaim &key access-token-plist)
  (up:tx-change-object-slots graph 'zaim
                             (up:%id zaim)
                             `((access-token ,access-token-plist))))
