#lang racket

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (iter (- k 1)
        (/ (n k)
           (d k))))

(cont-frac  (lambda (i) 1.0)
            (lambda (i) 1.0)
            15)