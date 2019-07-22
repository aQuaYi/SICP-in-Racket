#lang sicp

(#%require "../../book-code.rkt")

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                    (map (lambda (k) (list k j i))
                         (enumerate-interval 1 (- j 1))))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (target-triples-sum n target)
  (filter (lambda (triple)
            (= (accumulate + 0 triple) target))
          (unique-triples n)))

(target-triples-sum 10 20)
