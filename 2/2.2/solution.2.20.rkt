#lang sicp

(define (same-parity p . w)
  (define same?
    (if (odd? p)
        odd?
        even?))
  (define (iter w res)
    (cond ((null? w) res)
          ((same? (car w)) (iter (cdr w) (append res (cons (car w) `()))))
          (else (iter (cdr w) res)))))