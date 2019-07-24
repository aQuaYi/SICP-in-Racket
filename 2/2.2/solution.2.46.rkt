#lang sicp

(#%require "../../book-code.rkt")

(define v1 (make-vect 5 9))
(define v2 (make-vect 3 7))

(add-vect v1 v2)

(sub-vect v1 v2)

(scale-vect 0.5 v1)
