#lang racket
(require "rectangle-start-end-point.rkt")
(require "segment.rkt")

(define s (make-point 1 1))
(print-point s)

(define e (make-point 5 4))
(print-point e)

(define r (make-rectangle s e))

;;以下使用方式没有改变
(displayln (height-rectangle r))
(displayln (width-rectangle r))
(displayln (circumference-rectangle r))
(displayln (area-rectangle r))