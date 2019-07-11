#lang sicp

;; iterative-improve

(define (iterative-improve good-enough? improve)
  (define (iter x)
    (if (good-enough? x)
        x
        (iter (improve x))))
  (lambda (guess) (iter guess)))

;; 1.1.7 sqrt

(define (average a b)
  (/ (+ a b)
     2.))

(define (sqrt x)
  (define (f y)
    (/ x y))
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) 0.0001))
  (define (improve guess)
    (average guess (f guess)))
  ((iterative-improve good-enough? improve) 1.))

(sqrt 100)

;; average damp

(define (average-damp f)
  (lambda (x) (average x (f x))))

;; fixed point of transform

(define (fixed-point f first-guess)
  (define tolerance 0.00000001)
  (define (close-enough? y)
    (< (abs (- y (f y))) tolerance))
  ((iterative-improve close-enough? f) first-guess))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

;; 1.43
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f  n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (square x)
  (* x x))

;; n power

(define (power y n)
  (if (= n 0)
      1
      (* y (power y (- n 1)))))

(define (log2 x)
  (/ (log x) (log 2))) 

(define (nth-root x n)
  (define (fp-func x n)
    (lambda (y) (/ x (power y (- n 1)))))
  (define damp-time
    (floor (log2 n)))
  (define (damp f)
    ((repeated average-damp damp-time) f))
  (fixed-point-of-transform (fp-func x n) damp 1.))

(nth-root 64000000 6)