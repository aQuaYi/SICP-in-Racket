#lang racket
(require "segment.rkt")

(provide make-rectangle)
(define (make-rectangle start-point end-point)
  (cons start-point end-point))

(provide start-rectangle)
(define (start-rectangle r)
  (car r))

(provide end-rectangle)
(define (end-rectangle r)
  (cdr r))

(provide height-rectangle)
(define (height-rectangle r)
  (abs (- (y-point (end-rectangle r))
          (y-point (start-rectangle r)))))

(provide width-rectangle)
(define (width-rectangle r)
  (abs (- (x-point (end-rectangle r))
          (x-point (start-rectangle r)))))

(provide circumference-rectangle)
(define (circumference-rectangle r)
  (* 2
     (+ (height-rectangle r)
        (width-rectangle r))))

(provide area-rectangle)
(define (area-rectangle r)
  (* (height-rectangle r)
     (width-rectangle r)))

(provide print-rectangle)
(define (print-rectangle r)
  (newline)
  (print-raw-point (start-rectangle r))
  (display "->")
  (print-raw-point (end-rectangle r)))
