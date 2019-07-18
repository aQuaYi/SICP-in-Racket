#lang sicp

(define t
  (list 1
        (list 2
              (list 3 4)
              5)
        (list 6 7)))

t

(define (square-tree t)
  (cond ((null? t) nil)
        ((number? t) (* t t))
        (else (cons (square-tree (car t))
                    (square-tree (cdr t))))))

(square-tree t)

(define (square-tree-map t)
  (map (lambda (x)
         (if (number? x)
             (* x x)
             (square-tree x)))
       t))

(square-tree-map t)
