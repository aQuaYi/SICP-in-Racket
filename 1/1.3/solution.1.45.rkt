#lang sicp

;; average damp

(define (average a b)
  (/ (+ a b)
     2.))

(define (average-damp f)
  (lambda (x) (average x (f x))))

;; fixed point of transform

(define (fixed-point f first-guess)
  (define tolerance 0.00000001)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next))))
  (try first-guess))

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