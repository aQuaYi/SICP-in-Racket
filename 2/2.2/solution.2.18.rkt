#lang planet neil/sicp

(define (reverse l)
 (iter l `()) )

(define (iter remain res)
  (if (null? remain)
      res
      (iter (cdr remain) (cons (car remain) res))))

(reverse (list 1 2 3 4 5 6 7 8 9))
