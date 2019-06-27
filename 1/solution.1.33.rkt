#lang racket

(define (filtered-accumulate filter? combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter? a) (combiner (term a) (filtered-accumulate filter? combiner null-value term (next a) next b)))
        (else (combiner null-value (filtered-accumulate filter? combiner null-value term (next a) next b)))))

;; solution a) 
(define (prime? n)
  (= (smallest-divisor n) n ))

(define (smallest-divisor n)
  (find-divisor n 2))
 
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square a)
  (* a a))

(define (divides? a b)
  (= (remainder a b) 0))

(define (inc a) (+ a 1))

(define (prime-sum a b)
  (define (term a) a)
  (filtered-accumulate prime? + 0 term a inc b))

(prime-sum 3 10)

;; solution b)
(define (GCD a b)
  (if (= b 0)
      a
      (GCD b (remainder a b))))

(define (product-GCD1-under n)
  (define (term a) a)
  (define (filter? i)
    (= (GCD n i) 1))
  (filtered-accumulate filter? * 1 term 1 inc n))

(product-GCD1-under 10)