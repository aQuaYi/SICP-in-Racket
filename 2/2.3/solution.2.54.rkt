#lang sicp

(define a '(this is a list))

(define b '(this (is a) list))

(define (equal? a b)
 (or
  (eq? a b)
  (and (pair? a)
       (pair? b)
       (eq? (car a) (car b))
       (equal? (cdr a) (cdr b)))))

(equal? a a)

(equal? a b)

(equal? b b)

