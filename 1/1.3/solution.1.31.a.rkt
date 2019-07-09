#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;; -----

(define (factorial n)
  (define (identity x) x)
  (product identity 1 inc n))

(factorial 5)

(define (quarter-pi)
  (define (term k)
    (/ (* (- k 1) (+ k 1))
       (* k k)))
  (define (next k)
    (+ k 2))
  (product term 3.0 next 1000000))

(* 4 (quarter-pi))