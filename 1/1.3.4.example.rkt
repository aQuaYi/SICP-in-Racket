#lang racket

(require "fixed.point.rkt")

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
              1.0))

(sqrt 3)

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y))))
               1.0))

(displayln "***(cube-root 27)***")
(cube-root 27)

(define (deriv g)
  (let ((dx 0.00001))
    (lambda (x)
      (/ (- (g (+ x dx)) (g x))
         dx))))

(define (cube x) (* x x x))

(displayln "***((deriv cube) 5)***")
((deriv cube) 5)

(define (newton-transform g)
 (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (new-sqrt x)
  (newtons-method (lambda (y) (- (* y y) x))
                  1.0))
(displayln "***(new-sqrt 3)***")
(new-sqrt 3)