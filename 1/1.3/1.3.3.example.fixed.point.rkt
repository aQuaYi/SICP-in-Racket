#lang racket
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (close-enough? x y)
  (< (abs (- x y)) tolerance))

(define (average x y)
  (/ (+ x y) 2.0))

(fixed-point cos 1.0)

(fixed-point (lambda (y) (+ (sin y) (cos y)))
              1.0)

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
                1.0))

(sqrt 3)