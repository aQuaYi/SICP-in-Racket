#lang racket

(define (cont-frac n d k combine)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (combine (d i) result)))))
  (iter k 0.0))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
                             x
                             (* x x)))
             (lambda (i) (- (* i 2) 1))
             k
             -))

(tan-cf (/ pi 4) 1)
(tan-cf (/ pi 4) 2)
(tan-cf (/ pi 4) 3)
(tan-cf (/ pi 4) 4)
(tan-cf (/ pi 4) 5)
(tan-cf (/ pi 4) 6)
(tan-cf (/ pi 4) 7)
(tan-cf (/ pi 4) 8)
(tan-cf (/ pi 4) 9)
