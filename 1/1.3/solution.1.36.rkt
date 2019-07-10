#lang sicp

(define  tolerance 0.000001)

(define (average a b)
  (/ (+ a b)
     2.))

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? next guess)
          next
          (try (average next guess)))))
          ;(try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000)
                            (log x)))
             2)
