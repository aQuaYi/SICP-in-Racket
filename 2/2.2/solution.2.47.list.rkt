#lang sicp

(#%require "../../book-code.rkt")

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame f)
  (car f))

(define (edge1-frame f)
  (cadr f))

(define (edge2-frame f)
  (cadr (cdr f)))

(define f (make-frame 0 1 2))

(origin-frame f)

(edge1-frame f)

(edge2-frame f)
