#lang racket

(define (r-factorial n)
  (if (= n 1)
      1
      (* n (r-factorial (- n 1)))))

(r-factorial 6)

(define (i-factorial n)
  (i-factorial-iter 1 1 n))

(define (i-factorial-iter counter product n)
  (if (> counter n)
      product
      (i-factorial-iter (+ counter 1)
                        (* product counter)
                        n)))

(i-factorial 6)