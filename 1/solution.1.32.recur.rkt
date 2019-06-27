#lang racket

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-cubes a b)
  (define (cube n)
    (* n n n))
  (define (inc n)
    (+ n 1))
  (sum cube a inc b))

(sum-cubes 1 10)

(define (product term a next b)
  (accumulate * 1 term a next b))


(define (factorial n)
  (define (identity x) x)
  (define (next x) (+ x 1))
  (product identity 1 next n))

(factorial 5)