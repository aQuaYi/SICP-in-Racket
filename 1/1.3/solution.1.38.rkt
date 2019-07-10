#lang sicp

(define (cont-frac n d k)
  (define (frac f c)
    (if (= c 0)
        f
        (frac (/ (n c)
                 (+ (d c) f))
              (- c 1))))
  (frac (/ (n k) (d k)) (- k 1)))

(define (d k)
  (if (= 0
         (remainder (+ k 1) 3))
      (/ (* 2 (+ k 1))
         3)
      1))

(define e
  (+ 2.
     (cont-frac (lambda (i) 1)
                d
                1000)))

e