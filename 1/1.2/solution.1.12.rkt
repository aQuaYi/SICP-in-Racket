#lang sicp

(define (pascal row col)
  (cond ((or (< col 0) (< row col)) 0)
        ((or (= row col) (= col 0)) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

(pascal 4 2)
(pascal 8 4)
(pascal 4 10)