#lang racket

(require "fixed.point.rkt")

(fixed-point (lambda (x) (/ (log 1000) (log x)))
             1.1)

(displayln "***************")

(fixed-average-point (lambda (x) (/ (log 1000) (log x)))
             1.1)