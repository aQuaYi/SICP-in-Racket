#lang sicp

;;; O(n) 
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;;; O(1)
(define (adjoin-set x set)
  (cons x set))

;;; O(n^2)
(define (intersection-set s1 s2)
  (cond ((or (null? s1) (null? s2)) '())
        ((element-of-set? (car s1) s2)
         (cons (car s1)
               (intersection-set (cdr s1) s2)))
        (else (intersection-set (cdr s1) s2))))

;;; O(n)
(define (union-set s1 s2)
  (if (null? s1)
      s2
      (union-set (cdr s1)
                 (cons (car s1) s2))))

;;; 这种方式，降低了 adjoin-set 和 union-set 的复杂度
;;; 在这两种操作较多的场合，可以使用此种方式

(element-of-set? 1 (list 5 3 1))

(adjoin-set 7 (list 5 3 1))

(intersection-set (list 1 2 3 4 5 6)
                  (list 4 5 6 7 8 9))

(union-set (list 1 2 3 4 5 6)
           (list 4 5 6 7 8 9))