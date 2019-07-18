#lang sicp

(define t
  (list 1
        (list 2
              (list 3 4)
              5)
        (list 6 7)))

t

(define (square x)
  (* x x))

(define (tree-map proc tree)
  (map (lambda (subtree)
         (cond ((null? subtree) nil)
               ((number? subtree) (proc subtree))
               (else (tree-map proc subtree))))
         tree))

(define (square-tree t)
  (tree-map square t))

(square-tree t)
