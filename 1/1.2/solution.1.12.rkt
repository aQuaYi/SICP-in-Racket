#lang racket

(define (pascal row col)
  (cond ((or (< row 0) (< col 0) (< row col)) 0)
        ((= row col) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

(pascal 4 2)

(pascal 1024 256)