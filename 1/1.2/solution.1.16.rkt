#lang racket
(define (even? n)
  (= (remainder n 2) 0))

(even? 8)
(even? 5)

(define (square x)
  (* x x))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a ))
        (else (fast-expt-iter b (- n 1) (* a b)))))

(fast-expt 2 10)