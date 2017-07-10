#lang racket

(define (cont-frac n d k) 
    (cont-frac-iter n d k 0))

(define (cont-frac-iter n d i result)
    (define ())
    (if (= i 0)
        result
        (cont-frac-iter n d (- i 1) )
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cont-frac-cur n d k (+ i 1))))))

(cont-frac  (lambda (i) 1.0)
            (lambda (i) 1.0)
            15)