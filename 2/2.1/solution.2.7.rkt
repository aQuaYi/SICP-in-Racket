#lang racket
(require "interval.rkt")

(define x 
  (make-interval 0 1))

(lower-bound x)

(upper-bound x)