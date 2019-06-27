#lang racket
;解题思路是，先全部求和，再减去最小值
;所以，需要定义全部求和的函数，和，求最小值的函数

(define (sum x y z)
  (+ x y z))

(define (min x y z)
  (cond ((and (<= x y) (<= x y)) x)
        ((and (<= y x) (<= y z)) y)
        (else z)))

(define (sum-without-min x y z)
  (- (sum x y z)
     (min x y z)))

(sum-without-min 1 2 3)

(sum-without-min 9 6 3)

;如果min是用的<来判断最小值，这里的结果会是4
(sum-without-min 2 2 3)