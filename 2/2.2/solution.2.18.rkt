#lang racket
(define (reverse l)
  (if (null? (cdr  l))
      (car  l)
      (cons  (reverse (cdr l)) (car l))))

(reverse (list 1 2 3 4 5 6 7 8 9))