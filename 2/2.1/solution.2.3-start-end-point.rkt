#lang racket
(require "rectangle-start-end-point.rkt")
(require "segment.rkt")

(define s (make-point 1 1))
(print-point s)

(define e (make-point 5 4))
(print-point e)

(define rectangle (make-rectangle s e))

(displayln (height-rectangle rectangle))
(displayln (width-rectangle rectangle))
(displayln (circumference-rectangle rectangle))
(displayln (area-rectangle rectangle))