#lang racket

(require "segment.rkt")

(provide make-rectangle)
(define (make-rectangle x y height width)
  (cons (make-point x y) (cons height width)))

(provide start-rectangle)
(define (start-rectangle r)
  (car r))

(provide height-rectangle)
(define (height-rectangle r)
  (car (cdr r)))

(provide width-rectangle)
(define (width-rectangle r)
  (cdr (cdr r)))

(provide circumference-rectangle)
(define (circumference-rectangle r)
  (* 2
     (+ (height-rectangle r)
        (width-rectangle r))))

(provide area-rectangle)
(define (area-rectangle r)
  (* (height-rectangle r)
     (width-rectangle r)))
