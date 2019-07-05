#lang sicp

(define (real-prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2)) 

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? d n)
  (= (remainder n d)
     0))

(define (square a)
  (* a a))

; -----

(define (fermat-prime? n)
  (full-test? n (- n 1)))

(define (full-test? n a)
  (cond ((= a 0) #t)
        ((= a (expmod a n n)) (full-test? n (- a 1)))
        (else #f)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; ------

(define (carmichael? n)
  (and (fermat-prime? n)
       (not (real-prime? n))))

(define (check n)
  (display n)
  (display " Carmichael?: ")
  (display (carmichael? n))
  (newline))

(check 561)

(check 1105)

(check 1729)

(check 2465)

(check 2821)

(check 6601)
