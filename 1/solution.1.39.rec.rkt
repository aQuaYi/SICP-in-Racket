#lang racket

(define (cont-frac n d k combine)
  (define (cf i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (combine (d i) (cf (+ i 1))))))
  (cf 1.0))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
                             x
                             (* x x)))
             (lambda (i) (- (* i 2) 1))
             k
             -))

(tan-cf (/ pi 6) 10)