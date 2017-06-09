#lang racket
(define (cubert x)
  (cubert-iter 1.0 x x))

(define (cubert-iter new-guess old-guess x)
  (if (new-good-enough? new-guess old-guess)
      new-guess
      (cubert-iter (improve new-guess x)
                 new-guess
                 x)))

(define (improve guess x)
  (/ (+ (/ x
           (* guess guess))
        (* 2 guess))
     3))


(define (new-good-enough? new-guess guess)
  (< (abs (- (/ new-guess guess)
             1))
     0.0001))

(cubert 27)

(cubert 1331)

(define (cube x)
  (* x x x))

(define x 0.00001)
(displayln x)
(cubert (cube x))

(define y 300000000000000000000000000000000000000000)
(displayln y)
(cubert (cube y))