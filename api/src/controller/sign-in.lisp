(in-package :ghost.controller)


;;;;;
;;;;; sign-in-by-email
;;;;;
(defun get-sign-in-email (graph email-address password)
  (let ((email (ghost:get-email graph :address email-address)))
    (unless email (throw-code 401))
    (when (ghost:auth-deccot graph email password)
      email)))

(defun get-sign-in-email-ghost (graph email-address password)
  (let ((email (get-sign-in-email graph email-address password)))
    (unless email (throw-code 401))
    (let ((ghost (ghost:deccot-ghost graph email)))
      (or ghost (throw-code 401)))))

(defun sign-in-by-email (graph email-address password)
  (let ((ghost (get-sign-in-email-ghost graph email-address password)))
    (save-session ghost)
    (list :|status| "success")))


;;;;;
;;;;; sign-in
;;;;;
(defvar *redirect-url-sign-in* nil)
(defvar *redirect-url-success-sign-in* nil)

(defun sign-in (graph email-address password)
  (let ((result (sign-in-by-email graph email-address password)))
      (if (null *redirect-url-success-sign-in*)
          result
          (caveman2:redirect *redirect-url-success-sign-in*))))
