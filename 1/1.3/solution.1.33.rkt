#lang sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (product term a next b)
  (filtered-accumulate * * 1 term a next b))

;; -----

(define (quarter-pi)
  (define (term k)
    (/ (* (- k 1) (+ k 1))
       (* k k)))
  (define (next k)
    (+ k 2))
  (product term 3.0 next 1000000))

(* 4 (quarter-pi))