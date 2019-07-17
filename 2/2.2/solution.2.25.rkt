#lang sicp

(define A
  (list 1 3 (list 5 7) 9))

A

(cadr (cadr (cdr A)))

(define B
  (list (list 7)))

B

(car (car B))

(define C
  (list 1
        (list 2
              (list 3
                    (list 4
                          (list 5
                                (list 6 7)))))))

C

(cadr (cadr (cadr (cadr (cadr (cadr C))))))
