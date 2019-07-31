#lang sicp

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (key entry) (car entry))

(define (lookup x set)
  (cond ((null? set) false)
        ((= x (key (entry set)))
         (entry set))
        ((< x (key (entry set)))
         (lookup x (left-branch set)))
        (else
         (lookup x (right-branch set)))))
