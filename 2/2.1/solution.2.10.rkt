#lang racket
(require "interval.rkt")

(define x
  (make-interval 3 7))

(define y
  (make-interval 2 4))

(define z
  (make-interval -1 1))

(display-interval (div-interval x y))

(display-interval (div-interval x z))
