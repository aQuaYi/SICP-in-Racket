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

(define inc
  (lambda (x) (+ 1 x)))

((two inc) 1)

(define (plus m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))

(define (mult m n)
  (lambda (f)
    (lambda (x)
      ((m (n f)) x))))

(define five
  (plus two three))

(define five-inc
  (five inc))

(five-inc 3)

(define double
  (lambda (x) (* 2 x)))

((three double) 1)

(((plus two three) double) 1)

;;; 2^15=32768
(((mult three five) double) 1)