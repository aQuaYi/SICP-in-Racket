#lang racket

;当b>0时，a和b做+运算
;否则，a和b做-运算

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 2 3)

(a-plus-abs-b 2 -4)