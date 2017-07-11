#lang racket
(require "newtons-method.rkt")

(define (cubic a b c)
  (lambda (x) (+ (* x x x)
                 (* a x x)
                 (* b x)
                 c)))
(displayln "***(newtons-method (cubic 0 0 0) 1)***")
(newtons-method (cubic 0 0 0) 1)

(displayln "***(newtons-method (cubic 1 2 3) 1)***")
(newtons-method (cubic 1 2 3) 1)

(displayln "***(newtons-method (cubic 1 2 3) 100)***")
(newtons-method (cubic 1 2 3) 100)