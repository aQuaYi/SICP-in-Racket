#lang racket

(define (log x base)
  (if (= 0 (remainder x base))
      (+ 1 ( log (/ x base) base))
      0))

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (log z 2))

(define (cdr z)
  (log z 3))

(define z (cons 3 7))

(displayln z)

(car z)

(cdr z)