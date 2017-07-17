#lang racket

(require "interval.rkt")

(define xa 7)
(define xb 8)
(define ya 6)
(define yb 9)
(define x
  (make-interval xa xb))
(define y
  (make-interval ya yb))

(= (width (add-interval x y))
   (+ (width x)
      (width y)))

(= (width (sub-interval y x))
   (- (width y)
      (width x)))

(= (width (div-interval y x))
   (/ (width y)
      (width x)))

(= (width (mul-interval y x))
   (* (width y)
      (width x)))