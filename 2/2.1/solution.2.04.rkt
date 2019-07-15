#lang sicp

(define (cons x y)
     (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define z (cons 3 5))

(car z)

(define (cdr z)
  (z (lambda (p q) q)))

(cdr z)
