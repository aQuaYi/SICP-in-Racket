#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate +   
              0
              (map (lambda (sub)
                     (if (number? sub)
                         1
                         (count-leaves sub)))
                   t)))

(count-leaves (list
               (list
                (list 1 2)
                (list 3 4 5))
               (list 6 7 8)))
