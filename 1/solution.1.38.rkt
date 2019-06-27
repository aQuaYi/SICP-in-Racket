#lang racket

(define (cont-frac n d k) 
    (cont-frac-cur n d k 1))

(define (cont-frac-cur n d k i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cont-frac-cur n d k (+ i 1))))))

(define (e k)
  (+ 2
     (cont-frac (lambda (i) 1.0)
                (lambda (i) (if (= 0 (remainder (+ i 1) 3))
                                (* 2 (/ (+ i 1) 3))
                                1.0))
                k)))
(e 3)
(e 4)
(e 5)
(e 6)
(e 7)
(e 8)
(e 9)
(e 10)