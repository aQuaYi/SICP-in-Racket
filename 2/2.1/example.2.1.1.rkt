#lang racket
(require  "rat.rkt")

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 2 6))
(print-rat one-third)

(print-rat (mul-rat one-half one-third))

(print-rat (add-rat one-third one-third))