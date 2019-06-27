#lang racket
(define (smallest-divisor n)
  (find-divisor n 2))
 
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (square a)
  (* a a))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (divides? a b)
  (= (remainder a b) 0))

(smallest-divisor 199)

(smallest-divisor 1999)

(smallest-divisor 19999)

(smallest-divisor 4)

(smallest-divisor 49)

(smallest-divisor 77)