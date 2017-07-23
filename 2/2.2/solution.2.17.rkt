#lang racket
(define (last-pair l)
  (if (null? (cdr (cdr l)))
      (car (cdr l))
      (last-pair (cdr l))))

(last-pair (list 1 3 5 7 9))