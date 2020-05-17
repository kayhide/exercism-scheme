(import (rnrs))

(define (transpose matrix)
  (cond
   ((null? matrix) '())
   ((all? null? matrix) '())
   (else
    (cons
     (map car matrix)
     (transpose (map cdr matrix))
     ))))

(define (all? f xs)
  (cond
   ((null? xs) #t)
   ((f (car xs)) (all? f (cdr xs)))
   (else #f)
   ))

