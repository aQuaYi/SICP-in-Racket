#lang sicp

(#%require "interval.rkt")

(define x
  (make-interval 7 8))
(define y
  (make-interval 4 9))

(display-interval x)
(newline)
(display (width x))

(display-interval y)
(newline)
(display (width y))
(newline)

(= (width (add-interval x y))
   (+ (width x)
      (width y)))

(= (width (sub-interval y x))
   (+ (width y) ;; NOTICE: is +
      (width x)))

(= (width (div-interval y x))
   (/ (width y)
      (width x)))

(= (width (mul-interval y x))
   (* (width y)
      (width x)))