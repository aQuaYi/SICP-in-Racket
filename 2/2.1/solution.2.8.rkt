#lang racket
(require "interval.rkt")

(define x
  (make-interval  3 8))

(define y
  (make-interval 1 5))

(sub-interval x y)