#lang sicp

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (mento-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (square x)
  (* x x))

;;;

(define (in-unit-circle? x y)
  (< (+ (square x)
        (square y))
     1))

(define (estimate-integral p x1 x2 y1 y2 trials)
  (define (area)
    (* (- x2 x1)
       (- y2 y1)))
  (define (experiment)
    (p
     (random-in-range x1 x2)
     (random-in-range y1 y2)))
  (* (area) (mento-carlo trials experiment)))

(estimate-integral in-unit-circle? -1. 1. -1. 1. 10000000.)