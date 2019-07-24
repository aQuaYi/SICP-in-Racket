#lang sicp

(define a '(this is a list))

(define b '(this (is a) list))

(define (equal? A B)
  (if (null? A)
      (null? B)
      (let ((a0 (car A))
            (a-rest (cdr A))
            (b0 (car B))
            (b-rest (cdr B)))
        (cond ((or (number? a0)
                   (number? b0))
               (and (number? a0)
                    (number? b0)
                    (= a0 b0)))
              ((or (pair? a0)
                   (pair? b0))
               (and (pair? a0)
                    (pair? b0)
                    (equal? a0 b0)
                    (equal? a-rest b-rest)))
              (else
               (and (eq? a0 b0)
                    (equal? a-rest b-rest)))))))

(equal? a a)

(equal? a b)

(equal? b b)

