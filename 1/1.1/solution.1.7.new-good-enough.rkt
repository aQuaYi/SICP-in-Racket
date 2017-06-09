#lang racket
(define (sqrt x)
  (sqrt-iter 1.0 x x))

(define (sqrt-iter new-guess guess x)
  (if (new-good-enough? new-guess guess)
      new-guess
      (sqrt-iter (improve new-guess x)
                 new-guess
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y)
     2))

(define (new-good-enough? new-guess guess)
  (< (abs (- (/ new-guess guess)
             1))
     0.0001))

(define (square x)
  (* x x))

(define x 0.0001)
(displayln x)
(sqrt (square x))

(define y 300000000000000000000000000000000000000000)
(displayln y)
(sqrt (square y))