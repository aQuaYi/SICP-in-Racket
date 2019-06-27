#lang racket

(provide fixed-point)
(provide fixed-average-point)
(provide average)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define i 0)
    (define (try guess)
        (let ((next (f guess)))
            (displayln i)
            (incf i)
            (displayln next)
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (fixed-average-point f first-guess)
    (define i 0)
    (define (try guess)
        (let ((next (average guess (f guess))))
            (displayln i)
            (incf i)
            (displayln next)
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (close-enough? x y)
    (< (abs (- x y)) tolerance))

(define (average x y)
    (/ (+ x y) 2.0))

(define-syntax incf
  (syntax-rules ()
    ((_ x)   (begin (set! x (+ x 1)) x))
    ((_ x n) (begin (set! x (+ x n)) x))))

(define-syntax decf
  (syntax-rules ()
    ((_ x)   (incf x -1))
    ((_ x n) (incf x (- n)))))
