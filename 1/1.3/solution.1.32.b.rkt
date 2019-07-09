#lang sicp
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner (term a)
                        result))))
  (iter a null-value))

(define (product-iter term a next b)
  (accumulate * 1 term a next b))

;; -----

(define (factorial n)
  (define (identity x) x)
  (product-iter identity 1 inc n))

(factorial 5)

(define (quarter-pi)
  (define (term k)
    (/ (* (- k 1) (+ k 1))
       (* k k)))
  (define (next k)
    (+ k 2))
  (product-iter term 3.0 next 1000000))

(* 4 (quarter-pi))