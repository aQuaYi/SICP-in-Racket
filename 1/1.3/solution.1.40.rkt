#lang sicp

;; fixed point

(define (fixed-point f first-guess)
  (define  tolerance 0.000001)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next))))
  (try first-guess))

;; Newton Method

(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (g (+ x dx))
          (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x
       (/ (g x)
          ((deriv g) x)))))

(define (newton-method g  guess)
  (fixed-point (newton-transform g) guess))

;; cubic

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)))

;; zero point

(define (zero-point a b c)
  (newton-method (cubic a b c) 1.))

(zero-point 0 0 0)

(zero-point 3 8 -1380)