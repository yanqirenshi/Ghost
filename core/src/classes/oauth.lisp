(in-package :ghost)


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
