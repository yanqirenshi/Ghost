(in-package :ghost)


(defclass existence ()
  ((code :documentation ""
         :accessor code
         :initarg  :code
         :initform nil)
   (description :documentation ""
                :accessor description
                :initarg  :description
                :initform nil))
  (:documentation "実在を表わすクラス"))


(defclass buddha-nature ()
  ((buddhahood :accessor buddhahood
               :initarg  :buddhahood
               :initform (local-time:now))
   (nirvana :accessor nirvana
            :initarg  :nirvana
            :initform nil)))


(defclass naming ()
  ((name :documentation ""
         :accessor name
         :initarg  :name
         :initform nil))
  (:documentation "呼称を表すクラス"))
