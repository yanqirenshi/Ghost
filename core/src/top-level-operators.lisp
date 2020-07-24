(in-package :ghost)


(defun tx-make-ghost-with-email-password
    (graph &key address password)
  (assert (not (get-email graph :address address)))
  (let ((ghost  (tx-make-ghost graph))
        (deccot (tx-make-deccot-email graph address))
        (84key  (tx-make-84key graph password)))
    (assert (and ghost deccot 84key))
    (tx-make-deccot-84key graph deccot 84key)
    (tx-make-ghost-deccot graph ghost  deccot)))


(defun tx-make-ghost-with-deccot
    (graph &key (deccot-type :email) param)
  (assert graph)
  (cond ((eq deccot-type :email)
         (apply #'tx-make-ghost-with-email-password graph param))))
