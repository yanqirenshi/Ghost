(in-package :ghost)


(defclass deccot (existence shinra:shin)
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
