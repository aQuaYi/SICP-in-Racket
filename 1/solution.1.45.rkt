#lang racket
(require "fixed.point.rkt")

(define (nth-root x n)
  (fixed-point-of-transform (gen-x-n x n)
                            (repeated average-damp (- n 1))
                            1.0))

(define (fixed-point-of-transform g transform guess)
  (fixed-point  (transform g) guess))

(define (gen-x-n x n)
  (lambda (y) (/ x (nth-power y (- n 1)))))

(define (nth-power x n)
  (if (= n 1)
      x
      (* x (nth-power x (- n 1)))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y)
     2.0))

(nth-root 4 2)

(nth-root 1024 10)