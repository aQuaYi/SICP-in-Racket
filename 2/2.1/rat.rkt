#lang racket
(define (gcd n d)
  (cond ((< (abs n) (abs d))
         (gcd d n))
        ((= d 0)
         n)
        (else
         (gcd d (remainder n d)))))

(provide make-rat)
(define (make-rat n d)
  (let ((g (gcd n d)))
    (normalize-cons (/ n g) (/ d g))))

(define (normalize-cons n d)
  (if (< d 0)
      (cons (- n) (- d))
      (cons n d)))

(provide number)
(define (number x)
  (car x))

(provide denom)
(define (denom x)
  (cdr x))

(provide add-rat)
(define (add-rat x y)
  (make-rat (+ (* (number x) (denom y))
               (* (denom x) (number y)))
            (* (denom x) (denom y))))

(provide sub-rat)
(define (sub-rat x y)
  (make-rat (- (* (number x) (denom y))
               (* (denom x) (number y)))
            (* (denom x) (denom y))))

(provide mul-rat)
(define (mul-rat x y)
  (make-rat (* (number x) (number y))
            (* (denom x) (denom y))))

(provide div-rat)
(define (div-rat x y)
  (make-rat (* (number x) (denom y))
            (* (denom x) (number y))))

(provide equal-rat?)
(define (equal-rat? x y)
  (= (* (number x) (denom y)
        (* (denom x) (number y)))))

(provide print-rat)
(define (print-rat x)
  (newline)
  (display (number x))
  (display "/")
  (display (denom x)))

