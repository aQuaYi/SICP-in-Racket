#lang sicp

(#%require (only racket provide))

(provide element-of-set?)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(provide adjoin-set)
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((> x (car set))
         (cons (car set)
               (adjoin-set x (cdr set))))
        ((= x (car set)) set)
        (else (cons x set))))

(provide intersection-set)
(define (intersection-set s1 s2)
  (if (or (null? s1) (null? s2))
      '()
      (let ((x1 (car s1))
            (x2 (car s2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr s1)
                                       (cdr s2))))
              ((< x1 x2)
               (intersection-set (cdr s1) s2))
              ((< x2 x1)
               (intersection-set s1 (cdr s2)))))))

(provide union-set)
(define (union-set s1 s2)
  (cond ((null? s1) s2)
        ((null? s2) s1)
        (else (let ((x1 (car s1))
                    (x2 (car s2)))
                (cond ((= x1 x2) (cons x1
                                       (union-set (cdr s1)
                                                  (cdr s2))))
                      ((< x1 x2) (cons x1
                                       (union-set (cdr s1) s2)))
                      ((< x2 x1) (cons x2
                                       (union-set s1 (cdr s2)))))))))
