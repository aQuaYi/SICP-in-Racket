#lang sicp

(define (same-parity first . rest)
  (define same?
    (if (odd? first)
        odd?
        even?))
  (define (iter cands res)
    (cond ((null? cands)
           res)
          ((same? (car cands))
           (iter (cdr cands) (append res (list (car cands)))))
          (else
           (iter (cdr cands) res))))
  (iter rest (cons first nil)))

(same-parity 1 2 3 4 5 6 7 8 9 10)

(same-parity 2 3 4 5 6 7 8 9 10 11)
