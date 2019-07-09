#lang sicp

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a)
                          result))))
  (iter a 0))

;; -----

(define (fourth-power x)
  (* x x x x))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* dx
     (sum-iter f (+ a (/ dx 2.0)) add-dx b)))

;; -----

(define (simpson-integral f a b n)
  (define h (/ (- b a)
               n))
  (define (c x)
    (cond ((or (= x 0) (= x n)) 1)
          ((even? x) 2)
          (else 4)))
  (define (term k)
    (* (c k)
       (f (+ a
             (* k h)))))
  (* (/ h 3.0)
     (sum-iter term 0 inc n)))

(define (inc a)
  (+ a 1))

(integral fourth-power 0 1 0.01)
(simpson-integral fourth-power 0 1 100)

(integral fourth-power 0 1 0.001)
(simpson-integral fourth-power 0 1 1000)