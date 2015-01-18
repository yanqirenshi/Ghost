(in-package :ghost)

(defclass ghost (shinra:node) ())

(defclass existence ()
  ((code :documentation ""
         :accessor code
         :initarg  :code
         :initform nil))
  (:documentation "実在を表わすクラス"))


(defclass naming ()
  ((name :documentation ""
         :accessor name
         :initarg  :name
         :initform nil))
  (:documentation "呼称を表すクラス"))


;;;
;;; Deccot
;;;
(defclass deccot (existence naming shinra:node)
  ((description :documentation ""
                :accessor description
                :initarg  :description
                :initform nil)
   (ghost :documentation ""
          :accessor ghost
          :initarg  :ghost
          :initform nil))
  (:documentation "ghost が宿る体を表わすクラスです。"))

;; これ必要なんかなぁ。
;; どぉっせ cyber space とか oauth-provide と関係付けするんじゃし。
(defclass deccot-mail (deccot) ())
(defclass deccot-github (deccot) ())
(defclass deccot-google (deccot) ())
(defclass deccot-twitter (deccot) ())
(defclass deccot-facebook (deccot) ())



;;;
;;; cyber-space
;;;
(defclass cyber-space (existence naming shinra:node) ())



;;;
;;; Oauth Provider
;;;
(defclass oauth-provider (shinra:node naming)
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


#| クラス図
Ghost と Decot
shinra
+-----------+   +-----------+   +------+
| existence |   | naming    |   | node |
|===========|   |===========|   |======|
|+ code     |   |+ name     |   |------|
|-----------|   |-----------|   +------+
+-----------+   +-----------+      ^
^               ^            |
|               |            |
+---------------+------------+
|
O
+--------------+
| deccot       |
+-------+       |==============|
| ghost |       |+ description |
|=======|O----->|- ghost       |
|-------|       |--------------|
+-------+       +--------------+
^
|
|     +-------------+
+----O| deccot-mail |
|     +-------------+
|     +---------------+
+----O| deccot-github |
|     +---------------+
|     +---------------+
+----O| deccot-google |
|     +---------------+
|     +----------------+
+----O| deccot-twitter |
|     +----------------+
|     +-----------------+
`----O| deccot-facebook |
+-----------------+


Cyber space と Oauth provider
shinra
+-----------+   +-----------+   +------+
| existence |   | naming    |   | node |
|===========|   |===========|   |======|
|+ code     |   |+ name     |   |------|
|-----------|   |-----------|   +------+
+-----------+   +-----------+      ^ ^
^            ^     ^         | |
|            |     |         | |
+------------+---------------+ |
|                  |           |
|                  +----+------+
O                       |
+-------------+       +--------------------+
| cyber-space |       | oauth-provider     |
|=============|       |--------------------|
|-------------|       |+ request-token-uri |
+-------------+       |+ authorize-uri     |
|+ access-token-uri  |
|--------------------|
+--------------------+

|#
