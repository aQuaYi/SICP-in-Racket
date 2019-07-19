#lang sicp

(define m
  (list
   (list 1 2 3)
   (list 4 5 6)
   (list 7 8 9)))

(define v
  (list 100 10 1))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate +
              0
              (map * v w)))

(dot-product
 (list 1 2 3)
 (list 4 5 6))

(define (matrix-*-vector m v)
  (map (lambda (w)
         (dot-product v w))
       m))

(matrix-*-vector m v)

(define (transpose m)
  (accumulate-n cons nil m))

(transpose m)

(define (matrix-*-matrix m n)
  (let ((n-cols (transpose n)))
    (map (lambda (m-row)
           (matrix-*-vector n-cols m-row))
         m)))

(matrix-*-matrix m m)