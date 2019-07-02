#lang sicp

(define (f n)
  (if (< n 3)
      n
      (iter-f 2 1 0 2 n)))

(define (iter-f a b c count n)
  (if (= count n)
      a
      (iter-f (+ a
                 (* 2 b)
                 (* 3 c))
              a
              b
              (inc count)
              n)))

(f 2)

(f 3)

(f 4)

(f 30)

(f 100)