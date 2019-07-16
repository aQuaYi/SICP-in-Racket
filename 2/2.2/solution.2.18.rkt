#lang sicp

(define (reverse items)
  (if (null? (cdr items))
       items
      (append (reverse (cdr items))
              (cons (car items) nil))))

(reverse (list 1 2 3 4 5))
