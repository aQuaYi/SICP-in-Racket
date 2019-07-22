#lang sicp

(#%require "../../book-code.rkt")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list j i))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(unique-pairs 6)


(define (prime-sum-pairs n)
  (define (prime-sum? pair)
    (prime? (+ (car pair)
               (cadr pair))))
  (define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair)
                                   (cadr pair))))
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(prime-sum-pairs 6)
