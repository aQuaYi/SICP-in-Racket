#lang sicp

; a) recursion

(define (cont-frac n d k)
  (define (frac c)
    (if (> c k)
        0
        (/ (n c)
           (+ (d c)
              (frac (+ c 1))))))
  (frac 1))

(cont-frac (lambda (i) 1.)
           (lambda (i) 1.)
           100)

; b) iteration

(define (cont-frac-iter n d k)
  (define (frac f c)
    (if (= c 0)
        f
        (frac (/ (n c)
                 (+ (d c) f))
              (- c 1))))
  (frac (/ (n k) (d k)) (- k 1)))

(cont-frac-iter (lambda (i) 1.)
                (lambda (i) 1.)
                100)