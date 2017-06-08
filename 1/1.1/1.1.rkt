#lang racket
486
(+ 21 35 12 7)
( + (* 3
       (+ (* 2 4)
          (+ 3 5)))
    (+ (- 10 7)
       6))
(define size 5)
(* size 2)

;表达式
2
;表达式的组合
(* 2 2)
;表达式的抽象
(define x 2)
;表达式的更抽象
(define y (* x x))
y
;定义过程,是一种更强大的抽象过程。
;用(square x)来代表(* x x)的过程。x可以是任何数据。
(define (square x) (* x x))
(square 12)

(define (sum-of-squares x y)
  (+ (square x)(square y)))
(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1)(* a 2)))
(f 5)

(define (abs x)
  (cond ((> x 0)x)
        ((= x 0)0)
        ((< x 0)(- x))))
(abs -7)

(define (abs-with-if x)
  (if (< x 0)
      (- x)
      x))
(abs-with-if -8)

(define z 7)
(and (> z 5)(< z 10))