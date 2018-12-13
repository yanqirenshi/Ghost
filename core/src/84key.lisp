(in-package :ghost)

(defgeneric turn-the-key (84key password)
  (:method ((84key 84key) (password string))
    (string= (contents 84key) password)))
