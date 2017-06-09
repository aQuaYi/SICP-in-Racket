#lang racket
(define (inc a)
  (+ a 1))

(define (dec a)
  (- a 1))

;这是递归的方式计算
(define (r+ a b)
  (if (= a 0)
      b
      (inc (r+ (dec a) b))))

(r+ 4 5)

;这是迭代的方式计算
(define (i+ a b)
  (if (= a 0)
      b
      (i+ (dec a) (inc b))))

(i+ 4 5)