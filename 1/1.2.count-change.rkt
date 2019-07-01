#lang racket
(define (count-change amount)
  (iter amount 5))

(define (iter amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        ((+ (iter amount (- kinds-of-coins 1))
            (iter (- amount (first-denomenation kinds-of-coins)) kinds-of-coins)))))

(define (first-denomenation kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)

(count-change 1000)

(count-change 1500)