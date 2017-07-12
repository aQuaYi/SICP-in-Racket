#lang racket
(provide make-point)
(define (make-point x y)
  (cons x y))

(provide x-point)
(define (x-point p)
  (car p))

(provide y-point)
(define (y-point p)
  (cdr p))

(provide make-segment)
(define (make-segment start-point end-point)
  (cons start-point end-point))

(provide start-segment)
(define (start-segment segment)
  (car segment))

(provide end-segment)
(define (end-segment segment)
  (cdr segment))

(provide midpoint-segment)
(define (midpoint-segment segment)
  (make-point (/ (+ (x-point (start-segment segment))
                    (x-point (end-segment segment)))
                 2.0)
              (/ (+ (y-point (start-segment segment))
                    (y-point (end-segment segment)))
                 2.0)))

(provide print-point)
(define (print-point p)
  (newline)
  (print-raw-point p))

(provide print-segment)
(define (print-segment s)
  (newline)
  (print-raw-point (start-segment s))
  (display "->")
  (print-raw-point (end-segment s)))

(provide print-raw-point)
(define (print-raw-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (displayln ")"))