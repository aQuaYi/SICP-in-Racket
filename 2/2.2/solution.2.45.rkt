#lang sicp

(#%require sicp-pict)

(define (split f g)
  (define (rec painter n)
    (if (= n 0)
        painter
        (let ((smaller (rec painter (- n 1))))
          (f painter (g smaller smaller)))))
  rec)

(define right-split
  (split beside below))

(define up-split
  (split below beside))

(paint (up-split einstein 4))

(paint (right-split einstein 3))