#lang racket

(define (cuberoot x)
  (cubert-iter 1.0 x x)
  )

(define (cubert-iter new-guess guess x)
  (if (good-enough? new-guess guess)
      new-guess
      (cubert-iter (improve new-guess x)
                 new-guess
                 x)
      )
  )

(define (improve guess x)
  (/ (+ (/ x
           (* guess guess))
        (* 2 guess))
     3)
  )

(define (good-enough? new-guess guess)
  (< (abs (- (/ new-guess guess)
             1)
          )
     0.000001)
  )

(define (square x)
  (* x x)
  )

(define x 27)
(displayln x)
(cuberoot x)

(define y 27000000000000000000000000000000000000000000)
(displayln y)
(cuberoot y)