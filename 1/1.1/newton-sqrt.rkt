#lang sicp

(define (sqrt x)
  (sqrt-iter 1.0 x)
  )

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x))
  )

(define (good-enough? guess x)
  (< (abs (- x (* guess guess)) ) 0.0000001)
  )

(define (improve guess x)
  (average guess (/ x guess))
  )

(define (average x y)
  (/ (+ x y) 2)
  )

(define (abs x)
  (if (< x 0)
      (- x)
      x)
  )

(display "sqrt(9) = ")
(sqrt 9)

(display "sqrt(5) = ")
(sqrt 5)