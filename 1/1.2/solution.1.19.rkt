#lang sicp
(define (even? n)
  (= (remainder n 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (p-next p q)
  (+ (* p p)
     (* q q)))

(define (q-next p q)
  (+ (* 2 p q)
     (* q q)))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (p-next p q)
                   (q-next p q)
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 12)

(fib 40)

(fib 100)

(fib 10000) ;; so easy