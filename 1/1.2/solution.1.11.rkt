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
  (cond ((< n 3) n)
        (else (f-iter 2 1 0 n))))

(define (f-iter a b c count)
  (if (= count 0)
      a
      (f-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))