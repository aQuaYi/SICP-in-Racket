#lang racket
(require "fixed.point.rkt")

(fixed-point (lambda (x) (+ 1.0 (/ 1.0 x)))
             1.0)

(displayln "*************")

(fixed-average-point (lambda (x) (+ 1.0 (/ 1.0 x)))
             1.0)

