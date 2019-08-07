#lang sicp

(define (make-accumulator count)
  (lambda (amount)
    (begin (set! count (+ count amount))
           count)))

(define A (make-accumulator 5))

(A 10)

(A 10)

(A -5)
