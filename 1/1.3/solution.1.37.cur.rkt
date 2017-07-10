#lang racket

(define (cont-frac n d k) 
    (cont-frac-cur n d k 1))

(define (cont-frac-cur n d k i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cont-frac-cur n d k (+ i 1))))))

(cont-frac  (lambda (i) 1.0)
            (lambda (i) 1.0)
            15)