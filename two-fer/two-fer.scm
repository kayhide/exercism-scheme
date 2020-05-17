(import (rnrs))

(define two-fer
  (case-lambda
   ((name) (for name))
   (else (for "you"))
   ))

(define (for name)
  (string-append "One for " name ", one for me."))
