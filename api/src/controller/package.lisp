(defpackage ghost.controller
  (:nicknames :ghost.ctlr)
  (:use :cl)
  (:import-from :alexandria
                #:when-let)
  (:import-from :caveman2
                #:throw-code
                #:request-cookies
                #:*request*
                #:*session*)
  (:export #:sign-in
           #:sign-out
           #:check-session
           #:change-emails-password
           #:get-ghost
           #:make-ghost-with-email-password)
  (:export #:*redirect-url-success-sign-in*
           #:*redirect-url-sign-in*)
  (:export #:sign-in-by-email
           #:get-session
           #:*session-key-name*
           #:session-ghost
           #:find-ghosts)
  (:export #:list-ghosts-with-email))
(in-package :ghost.controller)
