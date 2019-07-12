#lang sicp

(#%require "segment.rkt")

(define s (make-point 1 1))
(define e (make-point 5 4))

(define segment (make-segment s e))
(print-segment segment)

(print-point (midpoint-segment segment))