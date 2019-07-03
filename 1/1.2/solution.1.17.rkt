#lang sicp

;; double必须使用+方式,因为*方式已经被重新定义了。
(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a
                 (* a (- b 1))))))

(* 123456789 987654321)

(* 7 9)
