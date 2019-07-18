#lang sicp

(define (subsets s)
  (define (combine a)
    (lambda (l) (append (list a) l)))
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (combine (car s)) rest)))))

(subsets (list 1 2 3))
