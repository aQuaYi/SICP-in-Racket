#lang racket

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define zero
  (lambda (f) (lambda (x) x)))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define three
  (lambda (f) (lambda (x) (f (f (f x))))))

;;; m+n
(define (plus m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))

;;; m*n
(define (mult m n)
  (lambda (f)
    (lambda (x)
      ((m (n f)) x))))

;;; m^n
(define (power m n)
  (n m))

(define inc (lambda (x) (+ 1 x)))

;;; 以下是验证
(displayln "((two inc) 0)")
((two inc) 0)

(displayln "((three inc) 0)")
((three inc) 0)

(define five
  (lambda (f)
    (lambda (x) ((three f) ((two f) x)))))

(displayln "((five inc) 0)")
((five inc) 0)

(displayln "((three (two inc)) 0)")
((three (two inc)) 0)

(displayln "(((lambda (f)
    (lambda (x)
      ((two (two (two f))) x))) inc) 0)")
(((lambda (f)
    (lambda (x)
      ((two (two (two f))) x))) inc) 0)

(displayln "(((three two) inc) 0)")
(((three two) inc) 0)


(displayln "(((power two three) inc) 0)")
(((power two three) inc) 0)

(displayln "(((five (three two)) inc) 0)")
(((five (three two)) inc) 0)

(displayln "(((zero (five (three two))) inc) 0)")
(((zero (five (three two))) inc) 0)