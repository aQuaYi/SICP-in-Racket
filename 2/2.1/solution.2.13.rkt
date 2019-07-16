#lang sicp

(define (make-interval a b) (cons a b)) 
(define (upper-bound interval) (max (car interval) (cdr interval))) 
(define (lower-bound interval) (min (car interval) (cdr interval))) 
(define (center i) (/ (+ (upper-bound i) (lower-bound i)) 2.)) 
  
;; Percent is between 0 and 100.0 
(define (make-interval-center-percent c p)
  (let ((width (* c (/ p 100.0))))
    (make-interval (- c width) (+ c width)))) 
  
(define (percent-tolerance i)
  (let ((center (/ (+ (upper-bound i) (lower-bound i)) 2.0))
        (width (/ (- (upper-bound i) (lower-bound i)) 2.0)))
    (* (/ width center) 100))) 
  
(define (mul-interval x y) 
  (let ((p1 (* (lower-bound x) (lower-bound y))) 
        (p2 (* (lower-bound x) (upper-bound y))) 
        (p3 (* (upper-bound x) (lower-bound y))) 
        (p4 (* (upper-bound x) (upper-bound y)))) 
    (make-interval (min p1 p2 p3 p4) 
                   (max p1 p2 p3 p4)))) 
  
  
(define i (make-interval-center-percent 10 0.5)) 
(define j (make-interval-center-percent 10 0.4)) 
(percent-tolerance (mul-interval i j)) 

(define (tolerance-of-mul i j)
  (+ (percent-tolerance i)
     (percent-tolerance j)))

(tolerance-of-mul i j)