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

(displayln "***(newtons-method (cubic 3 2 1) 100)***")
(newtons-method (cubic 3 2 1) 1.0)
;Value: -2.3247179572447267

(displayln "***(newtons-method (cubic 2 5 5) 100)***")
(newtons-method (cubic 2 5 5) 1.0)
;Value: -1.2332293376819243