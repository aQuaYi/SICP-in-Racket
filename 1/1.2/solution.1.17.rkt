#lang racket
(define (even? n)
  (= (remainder n 2) 0))

;; double必须使用+方式，因为*方式已经被重新定义了。
(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (fast-product a b c)
  (cond ((= b 1) (+ a c))
        ((even? b) (fast-product (double a) (halve b) c))
        (else (fast-product a (- b 1) (+ a c)))))

(define (* a b)
  (fast-product a b 0))

(* 3 10)
(* 3 99999999)