#lang racket
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y)
     2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess)
             x))
     0.001))

(displayln "直到内存耗尽也无法得到以下结果。因为Racket是应用序求值，new-if会在计算完else-clause后才展开表达式。但是else-clause是一个迭代计算，永远计算不完。")

(sqrt 2)
(sqrt 9)