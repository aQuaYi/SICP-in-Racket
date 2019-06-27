#lang racket

(define (cont-frac n d k)
  (define (cf i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cf (+ i 1))))))
  (cf 1.0))

(cont-frac  (lambda (i) 1.0)
            (lambda (i) 1.0)
            15)