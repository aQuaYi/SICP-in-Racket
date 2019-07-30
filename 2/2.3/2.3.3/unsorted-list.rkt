#lang sicp

(#%require (only racket provide))

(provide element-of-set?)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(provide adjoin-set)
(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(provide intersection-set)
(define (intersection-set s1 s2)
  (cond ((or (null? s1) (null? s2)) '())
        ((element-of-set? (car s1) s2)
         (cons (car s1)
               (intersection-set (cdr s1) s2)))
        (else (intersection-set (cdr s1) s2))))

(provide union-set)
(define (union-set s1 s2)
  (cond ((null? s1) s2)
        ((element-of-set? (car s1) s2)
         (union-set (cdr s1) s2))
        (else (union-set (cdr s1)  (cons (car s1) s2)))))
        