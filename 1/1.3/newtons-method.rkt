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

(define (deriv g)
  (let ((dx 0.00001))
    (lambda (x)
      (/ (- (g (+ x dx)) (g x))
         dx))))

(define (newton-transform g)
 (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(provide newtons-method)
(provide fixed-point)
(provide average)