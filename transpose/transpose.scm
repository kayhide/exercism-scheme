(import (rnrs))

(define (transpose matrix)
  (map chomp
       (go matrix)))

(define (go matrix)
  (cond
   ((null? matrix) '())
   ((all? null? matrix) '())
   (else
    (cons
     (map (lift car) matrix)
     (go (map (lift cdr) matrix))
     ))))

;; chomp : [a] -> [a]
;; removes trailing nils
(define (chomp xs)
  (foldr
   (lambda (x acc)
     (cond
      ((and (null? acc) (null? x)) '())
      (else (cons x acc))
      ))
   '() xs
   ))

;; foldr : (a -> b -> b) -> b -> [a] -> b
;; folds list rightward
(define (foldr f acc xs)
  (cond
   ((null? xs) acc)
   (else (f (car xs) (foldr f acc (cdr xs))))
   ))

;; all? : (a -> bool) -> [a] -> bool
;; tests if all elements meet the given condition
(define (all? f xs)
  (cond
   ((null? xs) #t)
   ((f (car xs)) (all? f (cdr xs)))
   (else #f)
   ))

;; lift : ([a] -> b) -> [a] -> (nil | b)
;; lifts function so that taking nil returns nil
(define (lift f)
  (lambda (xs)
    (cond
     ((null? xs) '())
     (else (f xs))
     )))

