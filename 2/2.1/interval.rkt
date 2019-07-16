#lang sicp

(#%require (only racket provide))

(provide make-interval)
(define (make-interval a b)
  (if (< a b)
      (cons a b)
      (cons b a)))

;; 2.7 ↓↓↓

(define (upper-bound interval) (max (car interval) (cdr interval))) 
(define (lower-bound interval) (min (car interval) (cdr interval))) 

;; 2.7 ↑↑↑

(provide add-interval)
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

;; 2.11 ↓↓↓

(provide mul-interval-cond)
(define (mul-interval-cond x y)
  (cond ((positive? x)
         (cond ((positive? y)
                (make-interval (* (lower-bound x) (lower-bound y))
                               (* (upper-bound x) (upper-bound y))))
               ((negative? y)
                (make-interval (* (lower-bound y) (upper-bound x))
                               (* (lower-bound x) (upper-bound y))))
               (else
                (make-interval (* (lower-bound y) (upper-bound x))
                               (* (upper-bound y) (upper-bound x))))))
        ((negative? x)
         (cond ((positive? y)
                (make-interval (* (lower-bound x) (upper-bound y))
                               (* (upper-bound x) (lower-bound y))))
               ((negative? y)
                (make-interval (* (upper-bound x) (upper-bound y))
                               (* (lower-bound x) (lower-bound y))))
               (else
                (make-interval (* (lower-bound x) (upper-bound y))
                               (* (lower-bound x) (lower-bound y))))))
        (else
         (cond ((positive? y)
                (make-interval (* (lower-bound x) (upper-bound y))
                               (* (upper-bound x) (upper-bound y))))
               ((negative? y)
                (make-interval (* (upper-bound x) (upper-bound y))
                               (* (lower-bound x) (upper-bound y))))
               (else
                (make-interval (min (* (upper-bound x) (lower-bound y))
                                    (* (lower-bound x) (upper-bound y)))
                               (max (* (lower-bound x) (lower-bound y))
                                    (* (upper-bound x) (upper-bound y)))))))))

;; 2.11 ↑↑↑

(provide mul-interval)
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;; 2.10 ↓↓↓

(provide div-interval)
(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "divisor cross 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

;; 2.10 ↑↑↑

;; 2.8 ↓↓↓

(provide sub-interval)
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

;; 2.8 ↑↑↑

;; 2.9 ↓↓↓

(provide width)
(define (width x)
  (/ (- (upper-bound x) (lower-bound x))
     2.0))

;; 2.9 ↑↑↑

(provide display-interval)
(define (display-interval i)
  (newline)
  (display "[")
  (display (lower-bound i))
  (display ",")
  (display (upper-bound i))
  (display "]"))
