#lang sicp

; a) recursion

(define (cont-frac n d k)
  (define (frac c)
    (if (> c k)
        0
        (/ (n c)
           (- (d c)
              (frac (+ c 1))))))
  (frac 1))

(define (tan-cf x k)
  (define (n c)
    (if (= c 1)
        x
        (* x x)))
  (define (d c)
    (- (* 2 c)
       1))
  (cont-frac n d k))

(tan-cf 1. 5)

; b) iteration

(define (cont-frac-iter n d k)
  (define (frac f c)
    (if (= c 0)
        f
        (frac (/ (n c)
                 (- (d c) f))
              (- c 1))))
  (frac (/ (n k) (d k)) (- k 1)))

(define (tan-cf-iter x k)
  (define (n c)
    (if (= c 1)
        x
        (* x x)))
  (define (d c)
    (- (* 2 c)
       1))
  (cont-frac-iter n d k))

(tan-cf-iter 1. 5)