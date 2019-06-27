#lang racket
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x)
      (/ (+ (f (+ x dx))
            (f x)
            (f (- x dx)))
         3.0))))

(define (square x)
  (* x x))

(displayln "***((smooth square) 5)***")
((smooth square) 5)

(define (smooth-n-times f n)
  ((repeated smooth n) f))

(displayln "***((smooth-n-times square 10) 5)***")
((smooth-n-times square 10) 5)