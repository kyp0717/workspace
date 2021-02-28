;;; -*- lexical-binding: t; -*-


(message "hello")


(defun a-exists-only-in-my-body (a)
  (other-function))

(defun other-function ()
  (message "I see `a', its value is %s" a))

(a-exists-only-in-my-body t)
