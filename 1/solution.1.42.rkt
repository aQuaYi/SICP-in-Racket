#lang racket
(define (compose f g)
  (lambda (x) (f (g x))))

(define square
  (lambda (x) (* x x)))

(define inc
  (lambda (x) (+ x 1)))

(displayln "***((compose square inc) 6)***")
((compose square inc) 6)