#lang racket
(define (double f)
  (lambda (x) (f (f x))))

(define inc
  (lambda (x) (+ x 1)))

(displayln "***((double inc) 1)***")
((double inc) 1)

(displayln "***(((double (double double)) inc) 5)***")
(((double (double double)) inc) 5)