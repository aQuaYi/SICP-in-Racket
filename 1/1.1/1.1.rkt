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