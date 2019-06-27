#lang R5RS

(#%require (only racket/base current-milliseconds))
(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

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

(define (prime? n)
  (= (smallest-divisor n) n ))

(define (min-prime-bigger-than n)
 (timed-prime-test n)
  (if (not (prime? n))
      (min-prime-bigger-than (+ n 1))))

(min-prime-bigger-than 1000)
(min-prime-bigger-than 10000)
(min-prime-bigger-than 100000)
(min-prime-bigger-than 1000000)