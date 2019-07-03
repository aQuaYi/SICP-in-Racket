#lang sicp

(define (sum-2-bigger x y z) (
                              cond
                               [ (and (< x y) (< x z)) (+ y z) ]
                               [ (and (< y x) (< y z)) (+ x z) ]
                               [ else (+ x y) ]
                               )
  )

(sum-2-bigger 1 2 3)
(sum-2-bigger 2 3 1)
(sum-2-bigger 2 1 3)
