#lang sicp

;; smooth

(define (smooth f)
  (define dx 0.0001)
  (define (average a b c)
    (/ (+ a b c)
       3.))
  (lambda (x) (average (f (- x dx))
                       (f x)
                       (f (+ x dx)))))

;; 1.43
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f  n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (square x)
  (* x x))

;; nth smooth

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

((n-fold-smooth square 3) 2)
