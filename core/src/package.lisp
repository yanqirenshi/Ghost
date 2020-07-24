(in-package :cl-user)
(defpackage ghost
  (:use :cl)
  (:export #:ghost
           #:nirvana!
           #:existence
           #:naming
           #:deccot
           #:cyber-space
           #:oauth-provider
           #:code
           #:name
           #:description
           #:request-token-uri
           #:authorize-uri
           #:access-token-uri
           ;;
           #:buddha-nature
           #:buddhahood
           #:nirvana)
  (:export #:get-ghost
           #:find-ghost
           #:tx-make-ghost)
  (:export #:get-email
           #:auth-deccot
           #:deccot-ghost)
  (:export #:tx-make-ghost-with-deccot)
  (:export #:tx-make-ghost-deccot-zaim
           #:tx-ensure-ghost-deccot-zaim
           #:get-ghost-zaim
           #:save-access-token))
(in-package :ghost)
