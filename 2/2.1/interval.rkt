#lang racket

(provide make-interval)
(define (make-interval a b)
  (if (< a b)
      (cons a b)
      (cons b a)))


(provide lower-bound)
(define (lower-bound x)
  (car x))

(provide upper-bound)
(define (upper-bound x)
  (cdr x))

(provide add-interval)
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (positive? x)
  (< 0 (lower-bound x)))

(define (negative? x)
  (> 0 (upper-bound x)))

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
        
(provide mul-interval)
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(provide div-interval)
(define (div-interval x y)
  (cond ((< 0 (* (lower-bound y) (upper-bound y)))
         (mul-interval x 
                       (make-interval (/ 1.0 (upper-bound y))
                                      (/ 1.0 (lower-bound y)))))
        (else (error "divisor cross 0"))))

(provide sub-interval)
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(provide width)
(define (width x)
  (/ (- (upper-bound x) (lower-bound x))
     2.0))


