#lang racket
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(fib 1)
(fib 8)
(fib 40)

(define (iter-fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
 (if (= count 0)
     b
     (fib-iter (+ a b) a (- count 1))))

(iter-fib 1)
(iter-fib 8)
(iter-fib 40)