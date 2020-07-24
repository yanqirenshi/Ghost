(in-package :ghost)


(defclass deccot (shinra:shin existence buddha-nature)
  ()
  (:documentation "ghost が宿る体を表わすクラスです。"))


(defclass email (deccot)
  ((address :documentation ""
            :accessor address
            :initarg  :address
            :initform nil)))


(defclass google   (deccot) ())

(defclass facebook (deccot) ())

(defclass twitter  (deccot) ())

(defclass zaim  (deccot)
  ((request-token :documentation ""
                  :accessor request-token
                  :initarg  :request-token
                  :initform nil)
   (access-token :documentation ""
                 :accessor access-token
                 :initarg  :access-token
                 :initform nil)))
