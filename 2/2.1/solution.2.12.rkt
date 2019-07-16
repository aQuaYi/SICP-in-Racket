#lang sicp

(#%require "interval.rkt")

(define (make-center-percent c p)
  (let ((low-percent (/ (- 100 p) 100.))
        (high-percent (/ (+ 100 p) 100.)))
  (make-interval (* c low-percent) (* c high-percent))))

(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

(define (percent i)
  (* (/ (- (upper-bound i)
           (lower-bound i))
        (center i))
     50))


(define (display-center-percent i)
  (newline)
  (display "[")
  (display (center i))
  (display ", ±")
  (display (percent i))
  (display "%]"))

(define i (make-center-percent 5 10))

(display-interval i)

(display-center-percent i)
