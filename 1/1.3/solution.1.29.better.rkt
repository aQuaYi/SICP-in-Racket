#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube n)
  (* n n n))

(define (inc n)
  (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))


(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a
          (* k h))))
  (define (factor k)
    (cond ((or (= k 0) (= k n)) 1)
          ((odd? k) 4)
          (else 2)))
  (define (odd? k)
    (= 1 (remainder k 2)))

  (define (term k)
    (* (factor k)
       (y k)))
  (* (sum term 0 inc n)
     (/ h 3.0)))

(integral cube 0 1 0.01)
(simpson-integral cube 0.0 1.0 100)

(integral cube 0 1 0.001)
(simpson-integral cube 0.0 1.0 1000)

(integral cube 0 1 0.0001)

(integral cube 0 1 0.00001)