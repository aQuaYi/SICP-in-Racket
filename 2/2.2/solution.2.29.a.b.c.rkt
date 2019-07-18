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

(define (torque branch)
  (* (branch-length branch)
     (weight branch)))

(define (balance? mobile)
  (if (number? mobile)
      #t
      (let ((left (left-branch mobile))
            (right (right-branch mobile)))
        (and (= (torque left)
                (torque right))
             (balance? (branch-structure left))
             (balance? (branch-structure right))))))

(balance? m)

(define b (make-mobile
           (make-branch 6 2)
           (make-branch 3 (make-mobile
                           (make-branch 1 3)
                           (make-branch 3 1)))))

b

(balance? b)