(in-package :cl-user)
(defpackage ghost.api.route
  (:use #:cl
        #:caveman2
        #:lack.middleware.validation
        #:ghost.api.render
        #:ghost.api.utililties)
  (:export #:*route*))
(in-package :ghost.api.route)


;;;;;
;;;;; Router
;;;;;
(defclass <router> (<app>) ())
(defvar *route* (make-instance '<router>))
(clear-routing-rules *route*)


;;;;;
;;;;; Routing rules
;;;;;
(defroute "/" ()
  (render-json "ネットは広大だわ・・・・・・・・"))

(defroute ("/sign/in" :method :POST) (&key |mail| |password|)
  (let ((mail-address |mail|)
        (password |password|))
    ;; mail-address から mail 取得する。
    ;; mail を取得する場合、password が正しいか確認する。
    ;; 取得した mail から ghost を取得する。
    ;; ghost を session へ記録する。
    (render-json "ネットは広大だわ・・・・・・・・")))


;;;;;
;;;;; Error pages
;;;;;
(defmethod on-exception ((app <router>) (code (eql 404)))
  (declare (ignore app))
  "404")
