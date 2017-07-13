#lang racket
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define zero
  (lambda (f) (lambda (x) x)))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define three
  (lambda (f) (lambda (x) (f (f (f x))))))

(define (plus a b) 
  (lambda (x) (a (b x))))

(define inc
  (lambda (x) (+ 1 x)))

(define one+
  (one inc))

(define two+
  (two inc))

(define three+
  (plus one+ two+))

(three+ 0)

(define double
  (lambda (x) (* 2 x)))

((three double) 3)

