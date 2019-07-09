#lang sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter a)
                    (term a)
                    null-value)
                (filtered-accumulate filter combiner null-value term (next a) next b))))
;; a)
;;
;; prime?

(define (prime? n)
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

;; prime-sum

(define (prime-sum a b)
  (filtered-accumulate prime? + 0 identity a inc b))

(prime-sum 2 10)

;; b)

(define (gcd n a)
  (if (= a 0)
      n
      (gcd a (remainder n a))))

(define (product-relatively-prime n)
  (define (relatively-prime?? n)
    (define (relatively-prime? a)
      (= 1 (gcd n a)))
    relatively-prime?)
  (filtered-accumulate (relatively-prime?? n) * 1 identity 2 inc (- n 1)))

(product-relatively-prime 10)
