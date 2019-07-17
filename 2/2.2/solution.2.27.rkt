#lang sicp

(define (reverse items)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (cons (car items) result))))
  (iter items nil))

(define (deep-reverse items)
  (define (iter cands result)
    (cond ((null? cands)
           result)
          ((pair? (car cands))
           (iter (cdr cands) (cons (deep-reverse (car cands)) result)))
          (else
           (iter (cdr cands) (cons (car cands) result)))))
  (iter items nil))

(define x (list (list 1 2) (list 3 4)))

(reverse x)

(deep-reverse x)
