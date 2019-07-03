#lang sicp

;; double必须使用+方式,因为*方式已经被重新定义了。
(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (* a b)
  (fast-product 0 a b))

(define (fast-product p a b)
  (cond ((= b 0) p)
        ((even? b) (fast-product p (double a) (halve b)))
        (else (fast-product (+ p a) a (- b 1)))))

(* 123456789 987654321)

(* 7 9)
