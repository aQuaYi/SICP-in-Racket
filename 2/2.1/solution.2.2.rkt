#lang racket
;具体实现放在了segment.rkt文件中
(require "segment.rkt")

(define s   (make-point 1 1))
(print-point s)

(define e (make-point 5 4))
(print-point e)

(define segment (make-segment s e))
(print-segment segment)

(print-point (start-segment segment))
(print-point (end-segment segment))
(print-point (midpoint-segment segment))