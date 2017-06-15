#lang racket

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

(f 2)
(f 3)
(f 4)
(f 5)
(f 6)

(define (iter-f n)
  (f-iter 2 1 0 0 n))

(define (f-iter a b c i count)
  (if (= i count )
      c
      (f-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (+ i 1)
              count)))

(iter-f 0)
(iter-f 1)
(iter-f 2)
(iter-f 3)
(iter-f 4)
(iter-f 5)
(iter-f 6)
(iter-f 7)
(iter-f 8)
