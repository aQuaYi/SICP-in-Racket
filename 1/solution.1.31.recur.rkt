#lang racket

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))


(define (factorial n)
  (define (identity x) x)
  (define (next x) (+ x 1))
  (product identity 1 next n))

(factorial 5)

(define (quarter-pi n)
  (define (term x)
    (/ (* (- x 1) (+ x 1) )
       (* x x)))
  (define (next x) (+ x 2))
  (product term 3.0 next n))

(* 4 (quarter-pi 10000000))