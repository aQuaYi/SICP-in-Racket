#lang sicp

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a)
                          result))))
  (iter a 1))

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
  (product-iter term 3.0 next 100))

(quarter-pi)