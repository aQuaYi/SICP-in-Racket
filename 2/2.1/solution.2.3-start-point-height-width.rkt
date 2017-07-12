#lang racket
(require "rectangle-start-point-height-width.rkt")
(require "segment.rkt")

(define r (make-rectangle 1 1 3 4))

;;以下使用方式没有改变
(displayln (height-rectangle r))
(displayln (width-rectangle r))
(displayln (circumference-rectangle r))
(displayln (area-rectangle r))