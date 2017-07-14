#lang racket
(require "interval.rkt")

(define x
  (make-interval  3 8))

(define y
  (make-interval 1 5))

(lower-bound x)

(upper-bound x)

(add-interval x y)

(mul-interval x y)

(div-interval x y)

(mul-interval (div-interval x y) y)

x