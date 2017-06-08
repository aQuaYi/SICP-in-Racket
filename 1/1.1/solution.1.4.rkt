#lang racket

;当b>0时，a和b做+运算
;否则，a和b做-运算
;注意: 在racket中，+-是函数，不是运算符。

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(display "(a-plus-abs-b 2 3) = ")
(a-plus-abs-b 2 3)

(display "(a-plus-abs-b 2 -4) = ")
(a-plus-abs-b 2 -4)