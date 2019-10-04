(in-package :ghost.controller)

(defun make-ghost-with-email-password (graph email-address password)
  (up:execute-transaction
   (ghost::tx-make-ghost-with-email-password graph
                                             :address  email-address
                                             :password password))
  (list :code 201))


(defun tx-change-emails-passwords (graph password_old password_new 84key-list)
  (when-let ((84key (car 84key-list)))
    ;; ねんのためチェック
    (assert (string= password_old (ghost::contents 84key)))
    (setf (ghost::contents 84key) password_new)
    (tx-change-emails-passwords graph password_old password_new (cdr 84key-list))))


(defun find-change-emails-password (graph password_old password_new mails)
  (when-let ((mail (car mails)))
    (when-let ((84key (ghost::deccot-84key graph mail)))
      (if (string/= password_old (ghost::contents (ghost::deccot-84key graph mail)))
          (change-emails-password-cor graph password_old password_new (cdr mails))
          (cons 84key (change-emails-password-cor graph password_old password_new (cdr mails)))))))


(defun change-emails-password (graph ghost-id password_old password_new)
  (unless ghost-id
    (caveman2:redirect *redirect-url-sign-in*))
  (assert (or password_old (= 0 (length password_old))))
  (assert (or password_new (= 0 (length password_new))))
  (let ((ghost (ghost:get-ghost graph :%id ghost-id)))
    (assert ghost)
    (let ((mails (ghost::ghost-deccot-emails graph ghost)))
      (assert mails)
      (let ((84key-list (find-change-emails-password graph password_old password_new mails)))
        (up:execute-transaction
         (tx-change-emails-passwords graph password_old password_new 84key-list))
        (list :count (length 84key-list))))))
