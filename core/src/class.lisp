(in-package :ghost)


;;;
;;; Common
;;;
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
               :initform (get-universal-time))
   (nirvana :accessor nirvana
            :initarg  :nirvana
            :initform nil)))


(defclass naming ()
  ((name :documentation ""
         :accessor name
         :initarg  :name
         :initform nil))
  (:documentation "呼称を表すクラス"))



;;;
;;; Core
;;;
(defclass ghost (shinra:shin) ())


(defclass deccot (existence shinra:ra)
  ((ghost :documentation ""
          :accessor ghost
          :initarg  :ghost
          :initform nil))
  (:documentation "ghost が宿る体を表わすクラスです。"))



(defclass cyber-space (existence naming shinra:shin) ())




;;;
;;; Oauth
;;;
(defclass oauth-provider (shinra:shin)
  ((request-token-uri :documentation ""
                      :accessor request-token-uri
                      :initarg  :request-token-uri
                      :initform nil)
   (authorize-uri     :documentation ""
                      :accessor authorize-uri
                      :initarg  :authorize-uri
                      :initform nil)
   (access-token-uri  :documentation ""
                      :accessor access-token-uri
                      :initarg  :access-token-uri
                      :initform nil)))
