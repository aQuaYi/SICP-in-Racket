#lang sicp

(#%require "interval.rkt")

(define x
  (make-interval  3 8))

(define y
  (make-interval 1 5))

(display-interval x)

(display-interval (sub-interval x y))

(display-interval (add-interval (sub-interval x y) y))