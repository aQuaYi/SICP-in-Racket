#lang sicp

(define  tolerance 0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1
                            (/ 1 x)))
             1.)