#lang racket
(define (sqrt x)
  (sqrt-iter 1.0 x)
  )

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)
      )
  )

(define (improve guess x)
  (average guess (/ x guess))
  )

(define (average x y)
  (/ (+ x y)
     2)
  )

(define (good-enough? guess x)
  (< (abs (- (* guess guess)
             x)
          )
     0.001)
  )

(define (square x)
  (* x x)
  )

(define x 0.0001)
(displayln x)
(sqrt (square x))

(define y 300000000000000000000000000000000000000000)
(displayln y)
(sqrt (square y))