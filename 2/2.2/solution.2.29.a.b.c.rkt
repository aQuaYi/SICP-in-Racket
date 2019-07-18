#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define m (make-mobile
           (make-branch 1 2)
           (make-branch 3 4)))

m

(display "-- a) --\n")

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(branch-length (left-branch m))

(branch-structure (right-branch m))

(display "-- b) --\n")

(define (weight branch)
    (let ((structure (branch-structure branch)))
      (if (number? structure)
          structure
          (total-weight structure))))

(define (total-weight mobile)
  (+ (weight (left-branch mobile))
     (weight (right-branch mobile))))

(total-weight m)

(display "-- c) --\n")

(define (balance? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (let ((left-length (branch-length left))
          (left-structure (branch-structure left))
          (left-weight (weight left))       
          (right-length (branch-length right))
          (right-structure (branch-structure right))
          (right-weight (weight right)))
      (and (= (* left-length left-weight)
              (* right-length right-weight))
           (or (number? left-structure)
               (balance? left-structure))
           (or (number? right-structure)
               (balance? right-structure))))))

(balance? m)

(define b (make-mobile
           (make-branch 6 2)
           (make-branch 3 (make-mobile
                           (make-branch 1 3)
                           (make-branch 3 1)))))

b

(balance? b)