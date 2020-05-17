(import (rnrs))

(define (is-divisible? x y)
  (zero? (mod x y)))

(define (leap-year? year)
  (cond
   ((is-divisible? year 400) #t)
   ((is-divisible? year 100) #f)
   ((is-divisible? year 4) #t)
   (else #f)
   ))
