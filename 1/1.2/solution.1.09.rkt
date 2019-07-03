#lang sicp

;这是递归的方式计算
(define (r+ a b)
  (display a)
  (display " ")
  (display b)
  (display "\n")
  (if (= a 0)
      b
      (inc (r+ (dec a) b))))

(r+ 4 5)

;这是迭代的方式计算
(define (i+ a b)
  (display a)
  (display " ")
  (display b)
  (display "\n")
  (if (= a 0)
      b
      (i+ (dec a) (inc b))))

(i+ 4 5)